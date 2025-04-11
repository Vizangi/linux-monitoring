# Monitoring

## Добро пожаловать в репозиторий по мониторингу

### Начало
- Этот репозиторий представляет собой на 75% задачник + необходимую теорию на 25%
- Глобально мы поднимем бэкенд на основе самописного банковского приложения с завязанной на него базой данных
- Замониторим бэкенд системой на основе **Grafana + Prometheus**
- Настроим фронтенд: **Grafana GUI** + **PromQL** в разрезе **Linux** (Terminal Debian)
- Будем использовать **Git** на постоянной основе
- Будем создавать и изменять виртуальные машины с помощью **Terraform**
- Научимся практикам автоматизации и развертывания приложений с помощью **Ansible**
- Научимся быстро и качественно деплоить **Backend** с помощью **Docker Compose**
- Научимся практикам **CI/CD**
- Поднимем кластер **Kubernetes** и замониторим его
- В финале у вас будет личный репозиторий на **GitHub**, который пойдет в портфолио
- [Пример схемы](https://raw.githubusercontent.com/lamjob1993/linux-monitoring/fd9a2eb51245e64e09c1da8e2b77ff13d26eaadf/.files/.bucket/%D0%94%D0%B8%D0%B0%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B0%20%D0%BC%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%D0%B0.drawio.svg) бэкенда мониторинга в первой части репозитория / Схемы постоянно обновляются, указаны приблизительные макеты
- [Пример схемы](https://miro.com/app/board/uXjVIMhc1ds=/) бэкенда после прохождения финального репозитория **Kubernetes** / Схемы постоянно обновляются, указаны приблизительные макеты

### Последовательность выполнения заданий
  1. Открываем директорию **`introduction_monitoring`** → `README.md` → `job_interview.md` → `support_tech_interview.md` → `legend_support_engineer.md`
      - **`Что будет:`** Введение в мониторинг, схема мониторинга, роадмэп, как проходить интервью

  2. Открываем директорию **`linux_install`** → `README.md` → `Список пакетов.md` → `Установка пакетов.md` → `tech_questions.md` → `job_interview.md`
      - **`Что будет:`** Установка Debian, установка MobaXterm, установка Visual Studio Code
  3. Настраиваем доступ по **`SSH`** в **`GitHub`** по [инструкции](https://github.com/lamjob1993/linux-monitoring/blob/main/.files/%D0%93%D0%B5%D0%BD%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20SSH%20%D0%B4%D0%BB%D1%8F%20GitHub.md)
      - **`Что будет:`** Генерация ключей, получение доступа по SSH
  4. Открываем директорию **`prometheus`** → `README.md` → `beginning` → `tasks_1.md` → `tasks_2.md` → `tasks_3.md` → `tech_questions.md` → `job_interview.md`
      - **`Что будет:`** Изучаем Promethues, разворачиваем Prometheus, схема запуска Prometheus, автоматизация на Bash, технические вопросы и вопросы к собеседованию
  5. Открываем директорию **`grafana`** → `README.md` → `tasks_1.md` → `tech_questions.md` → `job_interview.md`
      - **`Что будет:`** Изучаем Grafana, разворачиваем Grafana, схема запуска Grafana, рисуем и выводим первые дашборды, технические вопросы и вопросы к собеседованию
  6. Открываем директорию **`node-exporter`** → `README.md` → `tasks_1.md` → `tech_questions.md` → `job_interview.md`
      - **`Что будет:`** Изучаем Node Exporter, разворачиваем Node Exporter, схема запуска Node Exporter, выводим первые метрики, технические вопросы и вопросы к собеседованию
  7. Открываем директорию **`pushgateway`** → `README.md` → `tasks_1.md` → `tech_questions.md` → `job_interview.md`
      - **`Что будет:`** Изучаем Pushgateway, разворачиваем Pushgateway, схема запуска Pushgateway, пишем Bash скрипт на PUSH метрик, технические вопросы и вопросы к собеседованию
  8. Открываем директорию **`prometheus-federate`** → `README.md` → `tasks_1.md` → `tech_questions.md` → `job_interview.md`
      - **`Что будет:`** Изучаем Prometheus Federation, разворачиваем федерацию на два дата центра, схема запуска Federation, выводим метрики из федерации в центральный Prometheus, технические вопросы и вопросы к собеседованию
  9. Открываем директорию **`alertmanager`** → `README.md` → `tasks_1.md` → `tech_questions.md` → `job_interview.md`
      - **`Что будет:`** Изучаем Alertmanager, разворачиваем Alertmanager, схема запуска Alertmanager, выводим первые алерты в Telegram, технические вопросы и вопросы к собеседованию
  10. Открываем директорию **`process-exporter`** → `README.md` → `tasks_1.md` → `tech_questions.md` → `job_interview.md`
      - **`Что будет:`** Изучаем Process Exporter, разворачиваем Process Exporter, схема запуска Process Exporter, выводим первые метрики, технические вопросы и вопросы к собеседованию
  11. Открываем директорию **`blackbox-exporter`** → `README.md` → `tasks_1.md` → `tasks_2.md` → `tasks_3.md` → `tech_questions.md` → `job_interview.md`
      - **`Что будет:`** Изучаем Blackbox Exporter, разворачиваем Blackbox Exporter, схема запуска Blackbox Exporter, выводим первые метрики, мониторим сертификаты SSL, поднимаем Nginx и Nginx Exporter, технические вопросы и вопросы к собеседованию
  12. Открываем директорию **`custom-exporter`** → `README.md` → `tasks_1.md` → `tasks_2.md` → `tech_questions.md` → `job_interview.md`
      - **`Что будет:`** Пишем Custom Exporter, разворачиваем Custom Exporter, выводим кастомные метрики, технические вопросы и вопросы к собеседованию
  13. Открываем директорию **`postgresql`** → `README.md` → `tasks_1.md` → `tasks_2.md` → `tasks_3.md` → `tech_questions.md` → `job_interview.md` → **подумать над резервированием базы**
      - **`Что будет:`** Изучаем PostgreSQL и PostgreSQL Exporter, разворачиваем СУБД PostgreSQL и Exporter, схема запуска PostgreSQL Exporter, выводим первые метрики, генерируем данные для БД кредитного конвейера с помощью Python и библиотеки Fake, изучаем технические вопросы и вопросы к собеседованию
  14. Открываем директорию **`grafana`** → `README.md` → `tasks_2.md` → `tech_questions.md` → `job_interview.md`
      - **`Что будет:`** Закрепляем еще раз темы → `tech_questions.md` → `job_interview.md`
  15. После исполнения всех пунктов (**добавить раздел, как считать количество и скорость метрик для каждой команды**):
      - У вас должна быть написана полная Bash-автоматизация на деплой бэкенда мониторинга
      - Должны быть построены дашборды для всех экспортеров, включая глобальный дашборд с ссылками на них
  16. Далее нужно будет создать от своего лица публичный репозиторий в **GitHub** на тему мониторинга, который будет служить для вас, как портфолио для работодателя (так называемый [Pet-проект](https://practicum.yandex.ru/blog/chto-takoe-pet-proekty-idei-dlya-novichkov/ "С помощью пет-проектов можно улучшить навыки и найти работу. Рассказываем, как их создавать, чем вдохновляться, а также какие у таких проектов есть плюсы и минусы."))
      - В этот репозиторий нужно будет аккуратно сложить весь форк, по которому вы проходили задания из этого репозитория
      - Написать хорошее введение в файле **`Readme.md`**
      - Продумать, как вы презентуете все развёрнутые экспортеры и оставшееся ПО вместе с пройденным материалом по мониторингу
        - Это и Bash-скрипты, и Unit-файлы с автозапуском, и конфиг-файлы, включая готовые дашборды в виде JSON файлов и качественные скриншоты к ним
      - Вам нужно сделать всё, чтобы ваш репозиторий стал привлекательным для работодателя и только потом отправить мне на проверку

### О заданиях
**Задания написаны с техническим уклоном** в мониторинг и в `Linux` и таким образом, что о тех инструментах, которые в них используются спрашивают в 90% случаев на собеседованиях по части `Linux` у джунов:

- `DevOps/SRE`
- `Инженеров по сопровождению ПО`
- `Инженеров по мониторингу`
- `Администраторов Linux`
  
---

- Этот учебный репозиторий охватывает на 90% рутину вышеперечисленных должностей в базе
- Задания носят больше лабораторный характер, и я это понимаю, но они позволят наработать нужную практику для успешного прохождения собеседования. Где-то нужно будет подумать над заданиями, а где-то я даю подсказки
- Сразу всё задание со всеми пунктами через ChatGPT (Qwen) не прогоняем, иначе не пройдем собеседование
- Пользуемся Qwen только по точечным запросам, к примеру, `как работает команда на выдачу прав`, потому что это сильно быстрее, чем поиск в Google
- Делаем пункты строго по очереди и не перепрыгиваем

### GIT
- Мы будем работать с `Git`, научимся делать форк этого репозитория к себе в `GitHub` для последующего клона локально на ваш ПК:
  - Этот репозиторий специально сделан таким образом, чтобы сделать форк для вашего будущего проекта мониторинга
  - Настроим доступ по SSH до удаленного репозитория (который форкнули), иначе не получится пушить изменения на удаленный сервер
  - После любых успешных изменений в ваших конфиг-файлах и в коде будем пушить их в форкнутый репозиторий, то есть будем учиться сразу, как взрослые на практике, постепенно вплетая ежедневный прогресс в `GitHub`
  - Такая система контроля версий, как `GitHub` или её аналоги в виде `Bitbucket` и `GitLab` будут использоваться на любом IT-проекте, и с этой системой надо уметь работать на практике обязательно

### Окружение мониторинга

#### Backend

- Мы развернем бэкенд мониторинга в разрезе **Unit-сервисов** + поднимем балансир в виде **Nginx**
- Изучим сложные векторные схемы в разрезе мониторинга
- Поднимем **Prometheus** (познакомимся с моделями **Pull** и **Push**) + **Node Exporter** + **Alertmanager** + **All Exporters со всего репозитория** + автоматизируем процессы установки на **Bash** (а в дальнейшем научимся работать с **Ansible**)
- Напишем кастомные экспортеры (**Bash**) и разработаем свои самостоятельно (**Golang**)
- Разработаем базу данных **PostgreSQL** и развернем её, замониторив через **Postgres Exporter**
- Разберемся, как работает интерфейс **API** на практике, написав банковское приложение на **Python**, сняв с него метрики
- Горизантально смасштабируем **Prometheus** с помощью **Prometheus Federate** и **Mimir**
- Напишем (выпустим) тестовый блок сертификатов и замониторим их через **Blackbox Exporter**, а также пропингуем серверы
- Замониторим процессы с помощью **Process Exporter**
- Плавно перейдем от виртуализации и **Unit-сервисов** на контейнеризацию в разрезе **Docker** и поднимем наиболее сложный бэк с помощью **Docker Compose**
- CI/CD  # _(в работе)_
- Kubernetes/K8S  # _(в работе)_

#### Frontend

- Скачаем, подгрузим, нарисуем и разработаем дашборды в формате `JSON` для `Grafana` на основе метрик
  - Познакомимся с Data Source и с переменными в Grafana
- Изучим основы `Prometheus` и `PromQL` (базовый язык работы с БД `Prometheus`)
  - Будем применять на практике четыре золотых сигнала и изучим типы метрик
  - Выучим регулярные выражения
  - А также применим различные агрегации и функции

### Вывод

  - В настройку сети и **iptables** сильно углубляться не будем, так как у вас на работе будут готовые машины, на которых уже развёрнут софт и сетка уже давно растроена
  - Мы сразу идем на должность продвинутого **Juniour+** специалиста, а возможно и на первую планку **Middle**, где по сетям особо гонять не будут, но это не значит, что не нужно знать основы, которые я даю на курсе
  - Скорее всего на должности инженера по сопровождению-мониторингу вас будет ждать условный кейс по миграции системы мониторинга, либо миграции какого угодно софта с уже настроенных серверов **CentOS** на голые **Ubuntu Server** и т.д, где сетку настраивать не нужно 

### Пожелания

Желаю удачи! Вы на правильном пути!
