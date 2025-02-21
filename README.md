## Добро пожаловать в репозиторий Linux

### Начало
---
- В этой части мы поднимем мониторинг: `Grafana + Prometheus + Node Exporter` и научимся настраивать эту связку в разрезе `Linux`.
- Последовательность выполнения заданий следующая (читаем в разделах файл **readme.md** и исполняем):
  1. Открываем директорию `prometheus` _[попробовать настроить федерацию - возможно возьмем в работу в теме `Docker`]_
  2. Открываем директорию `grafana`
  3. Открываем директорию `process-exporter`
  4. Открываекм директорию `blackbox-exporter`
  5. Открываем директорию `node-exporter`
  6. После исполнения - настройте бэкенд мониторинга: натравите `Prometheus` на все экспортеры и замониторьте ваш сервер [ваша тачка]
  7. Далее [идем обратно в курс](https://teletype.in/@lamjob/wjNvt64l77l "Основной раздел обучения") и берем в исполнение полностью **п.10**

- Задания написаны только с техническим уклоном в мониторинг и в `Linux` и таким образом, что о тех инструментах, которые в них используются, спрашивают в 90% случаев на собеседованиях по части `Linux` у джунов:
  - `DevOps/SRE`
  - `Инженеров по сопровождению`
  - `Инженеров по мониторингу`
  - `Администраторов Linux`
- Если грубо говоря, то этот учебный репозиторий охватывает на 90% рутину вышеперечисленных должностей в базе. 
- Задания носят больше лабораторный характер, и я это понимаю, но они позволят наработать нужную практику для успешного прохождения собеседования. Где-то нужно будет подумать над заданиями, а где-то я даю подсказки.

- Сразу всё задание со всеми пунктами через [ChatGPT (Qwen)](https://chat.qwenlm.ai/ "Переход на оф. сайт Qwen.") не прогоняем, иначе не пройдем собеседование (пользуемся только Qwen по точечным запросам, к примеру, `как работает команда на выдачу прав`, потому что это сильно быстрее, чем поиск в Google).

- Делаем пункты строго по очереди, не перепрыгиваем!

### GIT
---
- Мы частично поработаем с `Git`, научимся делать [форк](https://habr.com/ru/companies/yandex_praktikum/articles/700708/ "Форк (Fork) — собственное ответвление (fork) какого-то проекта. Это означает, что GitHub создаст вашу собственную копию проекта, данная копия будет находиться в вашем пространстве имён, и вы сможете легко делать изменения путём отправки (push) изменений.") этого учебного репозитория к себе в `GitHub` для последующего [клона](https://git-scm.com/book/ru/v2/%d0%9e%d1%81%d0%bd%d0%be%d0%b2%d1%8b-Git-%d0%a1%d0%be%d0%b7%d0%b4%d0%b0%d0%bd%d0%b8%d0%b5-Git-%d1%80%d0%b5%d0%bf%d0%be%d0%b7%d0%b8%d1%82%d0%be%d1%80%d0%b8%d1%8f#r_git_cloning "Для получения копии существующего Git-репозитория, например, проекта, в который вы хотите внести свой вклад, необходимо использовать команду git clone.") локально на свой ПК:
  - Этот репозиторий специально сделан таким образом, чтобы сделать форк для вашего будущего проекта мониторинга
  - Настроим доступ по [SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent "Генерация нового ключа SSH и добавление его в ssh-agent.") с вашего рабочего ПК до удаленного репозитория (который форкнули), иначе не получится [пушить](https://git-scm.com/book/ru/v2/%D0%9E%D1%81%D0%BD%D0%BE%D0%B2%D1%8B-Git-%D0%A0%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-%D1%83%D0%B4%D0%B0%D0%BB%D1%91%D0%BD%D0%BD%D1%8B%D0%BC%D0%B8-%D1%80%D0%B5%D0%BF%D0%BE%D0%B7%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D1%8F%D0%BC%D0%B8 "Когда вы хотите поделиться своими наработками, вам необходимо отправить их в удалённый репозиторий. Команда для этого действия простая: git push <remote-name> <branch-name>.") изменения на ваш удаленный сервер
  - После любых успешных изменений в ваших конфиг-файлах и в коде будем пушить их в ваш форкнутый репозиторий, то есть будем учиться сразу, как взрослые на практике
  - Такая система, как `Bitbucket` и ее аналоги `GitHub`, `GitLab` будет на любом ИТ проекте 100% и с ней надо уметь минимально работать на практике

### Автоматизация, установка и запуск сервисов
---
- По заданиям мы скачаем и вручную распакуем архивы с бинарями: `системы мониторинга Prometheus`, `Grafana GUI` и `экспортера Node Exporter`
- Опишем их автозапуск файлами юнитов (`Unit`)
- Проверим запуск бэкенда мониторинга на веб-морде, параллельно проводя дебаг каждого приложения
- Далее напишем мини-автоматизацию этой рутины на `Bash`
- Сделаем тестовую миграцию на склонированную виртуальную машину `Ubuntu`:
  - В будущих уроках затронем тему автоматизации с помощью `Ansible`

### Настройка окружения мониторинга

#### Backend
---
- В разрезе настройки бэкенда мониторинга: пропишем `Prometheus`, как data source в `Grafana` и натравим `Prometheus` на `Node Exporter` (когда `Prometheus` собирает данные с экспортеров - это называется скрэйпинг (scrape), помним о том, что экспортеры в сам `Prometheus` ничего не отправляют, `Prometheus` опрашивает их по протоколу `HTTP` на основе таргетов своего же конфиг-файла)
- Напишем нагрузочное тестирование [Pushgateway](https://github.com/prometheus/pushgateway "Pushgateway — это компонент экосистемы Prometheus, предназначенный для приема и хранения метрик, которые нельзя собирать традиционным способом через pull-модель (т.е., когда Prometheus сам запрашивает данные у целевого сервиса). Pushgateway позволяет приложениям или скриптам отправлять (push) метрики на специальный промежуточный сервер, откуда их уже может собирать Prometheus.") через проброс метрик утилитой `Curl`:
  - Метрики будем генерить скриптом `Bash` в формате [Open Metrics](https://github.com/prometheus/OpenMetrics/tree/main "OpenMetrics представляет собой эволюцию формата Prometheus для представления метрик, сохраняя при этом совместимость с уже существующими инструментами и данными.")
  - Скрипт будет подсчитывать количество метрик запушенных в `Prometheus`
  - На вход скрипту можно будет задать интересующее количество метрик
  - Скрипт будет распараллелен по потокам процессора
  - Будет задание на подумать, как мониторить максимальную нагрузку на железо во время отработки скрипта:
    - Это и будет нагрузочным тестированием, когда надо будет посчитать, к примеру: сколько уходит `RAM` на каждые миллион метрик запушенных в `Pushgateway` 
- Научимся работать с кастомными метриками, задействуя [Textfile Collector](https://github.com/prometheus/node_exporter "Textfile Collector — это дополнительный компонент Node Exporter , который позволяет экспортировать метрики, записанные в текстовые файлы на диске, в формате, понятном для Prometheus. Это удобный способ собирать данные, которые не могут быть получены напрямую через системные вызовы или интерфейсы, но могут быть сгенерированы скриптами или другими программами.") в `Node Exporter`
- И решим нестандартную и абстрактную задачу для пользователя (такое тоже бывает в рабочей практике, будем развивать системное мышление):
  - Нужно будет построить график японских свечей для виджета `Grafana`, задействуя рандомный генератор четырех параметров для свечек, который мы напишем сами, чтобы свечки красиво строились на виджете:
    - Нужно будет подумать каким образом прописать значения свечек поверх `временного ряда` (Time Series), чтобы получился красивый график
    - `Time Series` - это набор данных, упорядоченных по времени, где каждый элемент содержит значение и соответствующий ему `Timestamp`
    - `Timestamp` - это конкретная метка времени, указывающая, когда произошло событие
    - Подсказка: скрипт с генерацией нужно будет дёргать через `Сrontab` хотя бы 1 раз в минуту, чтобы получился временной ряд хотя бы за 30 минут
    - То есть данное задание очень хорошо подходит на проработку понимания, как работает база данных временных рядов `Prometheus` (TSDB)

#### Frontend
---
- Скачаем и подгрузим дашборды в формате `JSON` в `Grafana`:
  - Изучим минимальные основы `PromQL` (базовый язык работы с БД TSDB в `Prometheus`)
  - [Изучим четыре золотых сигнала](https://habr.com/ru/companies/slurm/articles/546638/ "Основы распределённого мониторинга: четыре золотых сигнала.") (4 Golden Signals) и научимся применять их на практике
  - Нарисуем (создадим) вручную дашборды и виджеты:
    - Возьмем по 10 метрик с каждой инстанции мониторинга: `Prometheus`, `Grafana`, `Node Exporter`:
      - И научимся выводить их на дашборд
  - Воспроизведем абстрактную задачу из `Backend` раздела 

### Вывод
---
Мы проработаем, как разрез настройки бэкенда (`Prometheus` + `Node Exporter`), так и фронтенд (`Grafana GUI`). В настройку сети и `iptables` углубляться не будем, так как у вас на работе будут готовые 50-100 тачек, на которых уже развёрнут софт и сетка уже давно растроена (мы идем на `джун-джун+` специалиста, где по сетям особо гонять не будут, но это не значит, что не нужно знать основы, которые я даю на курсе). Либо же у вас будет условный кейс по миграции системы мониторинга либо миграции чего угодно с серверов `CentOS` на голые `Ubuntu Server` или на голые `SberLinux`.

### Удачи!
---
