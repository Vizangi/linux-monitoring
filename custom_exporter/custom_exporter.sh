#!/bin/bash

# Параметры
OUTPUT_DIR="/opt/linux_monitoring/custom_exporter"
CURL_RESULT_FILE="$OUTPUT_DIR/curl_result"
METRICS_FILE="$OUTPUT_DIR/final_metrics.prom"
TEMP_METRICS_FILE="$OUTPUT_DIR/final_metrics.prom"
SITES=("Facebook" "VK" "Twitter" "Yandex" "GitHub" "BBC" "Wiki" "X.com")
URLS=("https://facebook.com" "https://vk.com" "https://twitter.com" "https://yandex.ru" 
      "https://github.com" "https://bbc.com" "https://wikipedia.org" "https://x.com")

# Создаем директорию, если её нет
mkdir -p "$OUTPUT_DIR"

# Очистка временных файлов
> "$CURL_RESULT_FILE"
> "$METRICS_FILE"

# Функция для выполнения curl запроса
check_site() {
    local site_name="$1"
    local url="$2"
    
    # Выполняем curl с таймаутом 5 секунд
    response=$(curl -o /dev/null -s -w "%{http_code} %{time_total}" --connect-timeout 5 "$url" 2>&1)
    http_code=$(echo "$response" | awk '{print $1}')
    response_time=$(echo "$response" | awk '{print $2}')
    
    # Если сайт недоступен (например, timeout или ошибка), записываем код ошибки
    if [[ -z "$http_code" || "$http_code" == "000" ]]; then
        http_code="521"  # Код ошибки для недоступных сайтов
        response_time="0"
    fi
    
    # Записываем результат в файл
    echo "$site_name $http_code $response_time" >> "$CURL_RESULT_FILE"
}

# Параллельное выполнение запросов
for i in "${!SITES[@]}"; do
    check_site "${SITES[$i]}" "${URLS[$i]}" &
done

# Ждем завершения всех фоновых процессов
wait

# Формирование метрик для Prometheus
echo "# HELP site_http_status HTTP status code of the site" >> "$METRICS_FILE"
echo "# TYPE site_http_status gauge" >> "$METRICS_FILE"
echo "# HELP site_response_time Response time of the site in seconds" >> "$METRICS_FILE"
echo "# TYPE site_response_time gauge" >> "$METRICS_FILE"

while read -r line; do
    site_name=$(echo "$line" | awk '{print $1}')
    http_code=$(echo "$line" | awk '{print $2}')
    response_time=$(echo "$line" | awk '{print $3}')
    
    echo "site_http_status{site=\"$site_name\"} $http_code" >> "$METRICS_FILE"
    echo "site_response_time{site=\"$site_name\"} $response_time" >> "$METRICS_FILE"
done < "$CURL_RESULT_FILE"

# Атомарная запись файла
mv "$TEMP_METRICS_FILE" "$METRICS_FILE"
# Добавляем метку времени для Prometheus
echo "# EOF" >> "$METRICS_FILE"
