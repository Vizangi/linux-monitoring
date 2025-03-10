# Monitoring

## Добро пожаловать в репозиторий Linux

### Начало

- В этом репозитории мы научимся настраивать связку мониторинга в разрезе **Linux**
- Репозиторий представляет собой на 75% задачник + необходимую теорию для практики
- Глобально мы поднимем обвязку бэкенда мониторинга на основе **Prometheus** и настроим фронтенд в разрезе **Grafana GUI** + **PromQL** в разрезе **Linux** (Terminal Debian)


### Последовательность выполнения следующая
  1. Открываем директорию `linux_install` → `README.md`
  2. Зарегистрируйтесь и настройте доступ по `SSH` в `GitHub` по [инструкции](https://github.com/lamjob1993/linux-monitoring/blob/main/.files/%D0%93%D0%B5%D0%BD%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20SSH%20%D0%B4%D0%BB%D1%8F%20GitHub.md)
  3. Открываем директорию `prometheus` → `README.md` → `beginning` → `tasks_1.md` → `tasks_2.md`
  4. Открываем директорию `grafana` → `README.md` → `tasks_1.md`
  5. Открываем директорию `node-exporter` → `README.md` → `tasks.md`
  6. Открываем директорию `custom-exporter` → `README.md` → `tasks_1.md` → `tasks_2.md`
  7. Открываем директорию `pushgateway` → `README.md` → `tasks.md`
  8. Открываем директорию `prometheus-federate` → `README.md` → `tasks.md` → `После проверки закомментировать федерацию в основном конфиге`
  9. Открываем директорию `alertmanager` → `README.md` → `tasks.md`
  10. Открываем директорию `process-exporter` → `README.md` → `tasks.md`
  11. Открываем директорию `blackbox-exporter` → `README.md` → `tasks.md`
  12. **Открываем директорию** `mimir` → `README.md` → `tasks.md`
  13. **Открываем директорию** `nginx` → `README.md` → `tasks.md`
  14. **Открываем директорию** `nginx-exporter` → `README.md` → `tasks.md`
  15. Открываем директорию `grafana` → `README.md` → `tasks_2.md`
  16. После исполнения всех пунктов полностью настройте бэкенд мониторинга и дашборды для всех экспортеров

### О заданиях

**Задания написаны с техническим уклоном** в мониторинг и в `Linux` и таким образом, что о тех инструментах, которые в них используются спрашивают в 90% случаев на собеседованиях по части `Linux` у джунов:

- `DevOps/SRE`
- `Инженеров по сопровождению ПО`
- `Инженеров по мониторингу`
- `Администраторов Linux`
  
---

- Если грубо говоря, то этот учебный репозиторий охватывает на 90% рутину вышеперечисленных должностей в базе
- Задания носят больше лабораторный характер, и я это понимаю, но они позволят наработать нужную практику для успешного прохождения собеседования. Где-то нужно будет подумать над заданиями, а где-то я даю подсказки
- Сразу всё задание со всеми пунктами через [ChatGPT (Qwen)](https://chat.qwenlm.ai/ "Переход на оф. сайт Qwen.") не прогоняем, иначе не пройдем собеседование (пользуемся только Qwen по точечным запросам, к примеру, `как работает команда на выдачу прав`, потому что это сильно быстрее, чем поиск в Google)
- Делаем пункты строго по очереди, не перепрыгиваем!

### GIT
---
- Мы частично поработаем с `Git`, научимся делать [форк](https://github.com/lamjob1993/linux-monitoring/blob/main/.files/%D0%A4%D0%BE%D1%80%D0%BA%20%D0%B2%20GitHub.md) этого учебного репозитория к себе в `GitHub` для последующего клона локально на свой ПК:
  - Этот репозиторий специально сделан таким образом, чтобы сделать форк для вашего будущего проекта мониторинга
  - Настроим доступ по SSH с вашего рабочего ПК до удаленного репозитория (который форкнули), иначе не получится [пушить](https://git-scm.com/book/ru/v2/%D0%9E%D1%81%D0%BD%D0%BE%D0%B2%D1%8B-Git-%D0%A0%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-%D1%83%D0%B4%D0%B0%D0%BB%D1%91%D0%BD%D0%BD%D1%8B%D0%BC%D0%B8-%D1%80%D0%B5%D0%BF%D0%BE%D0%B7%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D1%8F%D0%BC%D0%B8 "Когда вы хотите поделиться своими наработками, вам необходимо отправить их в удалённый репозиторий. Команда для этого действия простая: git push <remote-name> <branch-name>.") изменения на ваш удаленный сервер
  - После любых успешных изменений в ваших конфиг-файлах и в коде будем пушить их в ваш форкнутый репозиторий, то есть будем учиться сразу, как взрослые на практике
  - Такая система, как `Bitbucket` и ее аналоги `GitHub`, `GitLab` будет на любом ИТ проекте 100% и с ней надо уметь минимально работать на практике

### Автоматизация, установка и запуск сервисов
---
- По заданиям мы скачаем и вручную распакуем архивы с бинарями: `системы мониторинга Prometheus`, `Grafana GUI`, `экспортера Node Exporter` и прочих экспортеров
- Опишем их автозапуск файлами юнитов `Unit`
- Проверим запуск бэкенда мониторинга на веб-морде, параллельно проводя дебаг каждого приложения
- Далее напишем мини-автоматизацию этой рутины на `Bash`
- В будущих уроках затронем тему автоматизации с помощью `Ansible`

### Настройка окружения мониторинга

#### Backend
---
- В разрезе настройки бэкенда мониторинга: пропишем `Prometheus`, как **data source** в `Grafana` и натравим `Prometheus` на `Node Exporter` и на прочие экспортеры (когда `Prometheus` собирает данные с экспортеров - это называется скрэйпинг (scrape), помним о том, что экспортеры в сам `Prometheus` ничего не отправляют, `Prometheus` опрашивает их по протоколу `HTTP` на основе таргетов (targets) своего же конфиг-файла)
- **Напишем нагрузочное тестирование** [Pushgateway](https://github.com/prometheus/pushgateway "Pushgateway — это компонент экосистемы Prometheus, предназначенный для приема и хранения метрик, которые нельзя собирать традиционным способом через pull-модель (т.е., когда Prometheus сам запрашивает данные у целевого сервиса). Pushgateway позволяет приложениям или скриптам отправлять (push) метрики на специальный промежуточный сервер, откуда их уже может собирать Prometheus.") через проброс метрик утилитой `Curl`:
  - Метрики будем генерить скриптом `Bash` в формате [Open Metrics](https://github.com/prometheus/OpenMetrics/tree/main "OpenMetrics представляет собой эволюцию формата Prometheus для представления метрик, сохраняя при этом совместимость с уже существующими инструментами и данными.")
  - Скрипт будет подсчитывать количество метрик запушенных в `Prometheus`
  - На вход скрипту можно будет задать интересующее количество метрик
  - Скрипт будет распараллелен по потокам процессора
  - Будет задание на подумать, как мониторить максимальную нагрузку на железо во время отработки скрипта:
    - Это и будет нагрузочным тестированием, когда надо будет посчитать, к примеру: сколько уходит `RAM` на каждые миллион метрик запушенных в `Pushgateway` 
- **Научимся работать с кастомными метриками**, задействуя [Textfile Collector](https://github.com/prometheus/node_exporter "Textfile Collector — это дополнительный компонент Node Exporter , который позволяет экспортировать метрики, записанные в текстовые файлы на диске, в формате, понятном для Prometheus. Это удобный способ собирать данные, которые не могут быть получены напрямую через системные вызовы или интерфейсы, но могут быть сгенерированы скриптами или другими программами.") в `Node Exporter`

#### Frontend
---
- Скачаем и подгрузим дашборды в формате `JSON` в `Grafana`:
  - Изучим основы `Prometheus` и `PromQL` (базовый язык работы с БД TSDB в `Prometheus`)
  - Научимся применять на практике четыре золотых сигнала
  - Нарисуем вручную дашборды и виджеты на основе метрик с экспортеров
    - Возьмем метрики с каждой инстанции мониторинга: `Prometheus`, `Grafana`, `Node Exporter` и т.д
      - Научимся выводить их на дашборд, а также применять агрегацию и функции `PromQL`

### Вывод
---
  - Мы проработаем разрез настройки бэкенда мониторинга в разрезе **Unit-сервисов** + поднимем балансир в виде **Nginx**:
    - **Prometheus** (познакомимся с моделями **Pull** и **Push**) + **Node Exporter** + **Alertmanager** + **All Exporters со всего репозитория** + автоматизируем процессы установки на **Bash** (а в дальнейшем научимся работать с **Ansible**)
    - Напишем кастомные экспортеры (**Bash**) и разработаем свои самостоятельно (**Golang**)
    - Разработаем свою базу данных **PostgreSQL** и развернем её, замониторив через **Postgres_Exporter**
    - Разберемся, как работает интерфейс **API** на практике, написав банковское приложение на **Python**, сняв с него метрики
    - Горизантально смасштабируем **Prometheus** с помощью **Prometheus Federate** и **Mimir**
    - Напишем (выпустим) тестовый блок сертификатов и замониторим через **Blackbox Exporter** и пропингуем серверы, а также замониторим процессы с помощью **Process Exporter**
    - Плавно перейдем от **Unit-сервисов** на контейнеризацию (**Docker**) и поднимем более сложный бэк с помощью **Docker Compose**
    - А также проработаем разрез фронтенда **Grafana GUI** + **PromQL**, по ходу изучения курса, нарисовав, как простые, так и сложные дашборды, используя функции и агрегации
  - В настройку сети и **iptables** сильно углубляться не будем, так как у вас на работе будут готовые машины, на которых уже развёрнут софт и сетка уже давно растроена
  - Мы идем на **Juniour-Juniour+** специалиста, где по сетям особо гонять не будут, но это не значит, что не нужно знать основы, которые я даю на курсе
  - Скорее всего на должности инженера по сопровождению-мониторингу вас будет ждать условный кейс по миграции системы мониторинга, либо миграции чего угодно с серверов **CentOS** на голые **Ubuntu Server** и т.д

### Пожелания
---
Желаю удачи, вы на правильном пути!
