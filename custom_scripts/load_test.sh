#!/bin/bash

# Параметры
PUSHGATEWAY_URL="http://192.168.31.42:9091/metrics/job/load_testing"
METRIC_COUNT=$1

if [[ -z "$METRIC_COUNT" || $METRIC_COUNT -lt 100000 || $METRIC_COUNT -gt 1000000 ]]; then
    echo "Использование: $0 <количество_метрик>"
    echo "Количество метрик должно быть от 100,000 до 1,000,000."
    exit 1
fi

# Генерация и отправка метрик
for i in $(seq 1 $METRIC_COUNT); do
    METRIC_NAME="custom_metric_$i"
    METRIC_VALUE=$((RANDOM % 100))
    
    # Формирование данных для отправки
    DATA="# TYPE $METRIC_NAME gauge\n$METRIC_NAME $METRIC_VALUE"
    
    # Отправка метрики в Pushgateway
    echo -e "$DATA" | curl --data-binary @- "$PUSHGATEWAY_URL"
done

echo "Отправлено $METRIC_COUNT метрик в Pushgateway."
