# linux-monitoring

_Задание написано таким образом, что о тех инструментах, которые в нем используются, спрашивают более чем в 80% случаев на собеседовании по части Linux у джунов: **DevOps, SRE, инженеров по сопровождению/мониторингу и администраторов Linux**. Задание носит больше лабораторный характер, и я это понимаю, но оно позволит наработать нужную практику, нужно будет где-то подумать, а где-то я даю подсказки. Сразу всё задание со всеми пунктами через ChatGPT (Qwen) не прогоняем, иначе не пройдем собеседование (пользуемся только Qwen по точечным запросам, к примеру, как работает команда на выдачу прав, потому что это сильно быстрее, чем поиск в Google). Делаем пункты строго по очереди, не перепрыгиваем!_

По заданию мы вручную распакуем архив с бинарём системы мониторинга **Prometheus**, опишем его автозапуск файлом юнита (**Unit**) и проверим запуск **Prometheus** на веб-морде, параллельно проведя его дебаг. Далее напишем мини-автоматизацию этой рутины на **Bash** и сделаем тестовую миграцию на склонированную виртуальную машину **Ubuntu** (в будущих уроках затронем данную тему с помощью **Ansible**). В настройку сети и **iptables** углубляться не будем, так как у вас на работе будут готовые 50-100 тачек, на которых уже развёрнут софт и сетка уже давно растроена. Либо же будет условный кейс по миграции системы мониторинга и миграции чего угодно с серверов CentOS на голые Ubuntu Server или на голые SberLinux.

**Начало**

1. Изначально у вас должна быть установлена первичная виртуалка (А) **Ubuntu 22.04** на английском языке:
   - После установки склонируйте её (это будет виртуалка Б) и продолжайте работать виртуалке (А)
   - Это нужно в целях резервирования и для выполнения дальнейших заданий
3. Взять директорию из корня - **/opt** (является частью стандартной файловой системы и предназначена для хранения дополнительного программного обеспечения) и создать в ней директорию - **/monitoring** и склонировать в нее учебный репозиторий по выданной ссылке (подсказка: **git clone**).
4. Найти и скачать архив **.tar.gz** дистрибутива **Prometheus** для **Linux** самой последней второй (не третьей) версии в склонированную директорию **/opt/monitoring/linux-monitoring/prometheus/** (подсказка: GitHub, AMD64, bin).
5. Разархивировать архив и найти внутри директории бинарь **Prometheus** (директория после разархивации будет выглядеть, к примеру, вот так - **prometheus-2.53.2.linux-amd64**).
6. Проверить версию **Prometheus** (подсказка: **./prometheus --version**) и запустить бинарь "на коленке" (подсказка: **./bin/prometheus** или **./prometheus**).
7. Проверить запущенный на коленке **Прометей** (Прометеус) на веб-морде (подсказка: проверка должна быть в браузере на порту **:9090**, чтобы понять по какому ip адресу стучаться в **Прометеус**, нужно знать ip адрес интерфейса своей тачки (тачками называют машины и серверы - это синонимы)).
8. Далее переходим в новую рабочую директорию - **/opt/monitoring/linux-monitoring/prometheus/** и постепенно будем наполнять ее нужными файлами из директории - **prometheus-2.53.2.linux-amd64**.
9. Далее создать директории (подсказка: **sudo mkdir -p** /opt/monitoring/linux-monitoring/prometheus/**{bin,etc,data,consoles,console_libraries}**):
    - **/bin**
    - **/etc**
    - **/data**
    - **/consoles**
    - **/console_libraries**
    - И положить их в конечную директорию - /opt/monitoring/linux-monitoring/**prometheus/**
11. Скопировать в директорию **/bin** бинарь **Prometheus** (подсказка: **п.4**).
12. В директории **/etc** создать пустой файл - **prometheus.yml**:
    - Затем наполнить **prometheus.yml** дефолтным конфигом **Prometheus**
    - Подсказка: **GitHub** - **prometheus/documentation/examples/prometheus.yml**
    - А также подумать, что означает этот конфиг построчно на пару с **Qwen GPT**)
14. Наполнить директории:
    - **/data** - оставить пустой
    - **/consoles** - наполнить по аналогии с директорией - **prometheus-2.53.2.linux-amd64**
    - **/console_libraries** - наполнить по аналогии с директорией - **prometheus-2.53.2.linux-amd64**
16. Далее создать пустой файл - **Unit** в корневой директории - **/prometheus** и наполнить (на сленге - написать) его для **Prometheus**:
    - Подсказка: логически понять, как назвать **Unit** файл (это будет файл сервиса **Prometheus**) и как он должен быть написан внутри
18. Далее одной командой выдать права **777** на корневую директорию **/opt** и на все файлы внутри (это называется рекурсивно), в которой уже должны лежать файлы по структуре ниже (проверить результат выполнения команды): 

          --права--         /prometheus
          drwxrwxrwx        ├── bin/                           # Директория для бинарных файлов
          -rwxrwxrwx        │   └── prometheus                 # Бинарный файл Prometheus
          drwxrwxrwx        ├── etc/                           # Директория для конфигурационных файлов
          -rwxrwxrwx        │   └── prometheus.yml             # Основной конфигурационный файл Prometheus
          drwxrwxrwx        ├── data/                          # Директория для хранения данных, будет наполнена при работе Prometheus
          drwxrwxrwx        ├── consoles/                      # Директория для шаблонов консолей Prometheus
          -rwxrwxrwx        │   ├── index.html.example         # Пример главной страницы
          -rwxrwxrwx        │   ├── node-cpu.html              # Шаблон консоли для мониторинга CPU узла
          -rwxrwxrwx        │   ├── node-disk.html             # Шаблон консоли для мониторинга диска узла
          -rwxrwxrwx        │   ├── node.html                  # Общий шаблон консоли для узла
          -rwxrwxrwx        │   ├── node-overview.html         # Обзорная консоль для узла
          -rwxrwxrwx        │   ├── prometheus.html            # Шаблон консоли для Prometheus
          -rwxrwxrwx        │   └── prometheus-overview.html   # Обзорная консоль для Prometheus
          drwxrwxrwx        ├── console_libraries/             # Директория для библиотек шаблонов консолей
          -rwxrwxrwx        │   ├── menu.lib                   # Библиотека меню
          -rwxrwxrwx        │   └── prom.lib                   # Библиотека Prometheus
          -rwxrwxrwx        └── prometheus.service             # Сервисный Unit-файл для запуска Prometheus

19. Обычно такие права **777** не выдаются (либо выдаются в песочнице), но у нас учебный проект, поэтому имеем это ввиду:
    - Параллельно идем в **ИИ GPT Qwen** и учимся выставлять цифровые права
    - Заодно научимся понимать, что такое **777** и как эти цифры образуются (**4+2+1**)
12. Далее нужно создать группу пользователей **prometheus** и добавить туда пользователя **prometheus**:
    - Далее проверить эту группу пользователей, что **prometheus** добавился (одновременно идем в **ИИ GPT Qwen** и учимся назначать владельца на директорию и на файлы)
    - При дефолтной установке пакета **Prometheus**, будь то **.rpm** или **.deb** назначение прав и назначение владельца происходит автоматически
    - Здесь мы делаем назначение вручную, чтобы понимать логику работы команд: **chown** и **chmod**
14. Затем рекурсивно назначить (изменить) владельца (пользователя) - **prometheus** для директории - **/opt** и для всех файлов внутри (проверить результат выполнения):

           --права--  -владелец-  -группа-            /prometheus
           drwxrwxrwx prometheus prometheus           ├── bin/                           # Директория для бинарных файлов
           -rwxrwxrwx prometheus prometheus           │   └── prometheus                 # Бинарный файл Prometheus
           drwxrwxrwx prometheus prometheus           ├── etc/                           # Директория для конфигурационных файлов
           -rwxrwxrwx prometheus prometheus           │   └── prometheus.yml             # Основной конфигурационный файл Prometheus
           drwxrwxrwx prometheus prometheus           ├── data/                          # Директория для хранения данных, будет наполнена при работе Prometheus
           drwxrwxrwx prometheus prometheus           ├── consoles/                      # Директория для шаблонов консолей Prometheus
           -rwxrwxrwx prometheus prometheus           │   ├── index.html.example         # Пример главной страницы
           -rwxrwxrwx prometheus prometheus           │   ├── node-cpu.html              # Шаблон консоли для мониторинга CPU узла
           -rwxrwxrwx prometheus prometheus           │   ├── node-disk.html             # Шаблон консоли для мониторинга диска узла
           -rwxrwxrwx prometheus prometheus           │   ├── node.html                  # Общий шаблон консоли для узла
           -rwxrwxrwx prometheus prometheus           │   ├── node-overview.html         # Обзорная консоль для узла
           -rwxrwxrwx prometheus prometheus           │   ├── prometheus.html            # Шаблон консоли для Prometheus
           -rwxrwxrwx prometheus prometheus           │   └── prometheus-overview.html   # Обзорная консоль для Prometheus
           drwxrwxrwx prometheus prometheus           ├── console_libraries/             # Директория для библиотек шаблонов консолей
           -rwxrwxrwx prometheus prometheus           │   ├── menu.lib                   # Библиотека меню
           -rwxrwxrwx prometheus prometheus           │   └── prom.lib                   # Библиотека Prometheus
           -rwxrwxrwx prometheus prometheus           └── prometheus.service             # Сервисный Unit-файл для запуска Prometheus

15. Затем скопировать уже написанный вами **Unit** в директорию **/etc/systemd/system/** автозапуска Linux с уже выставленными правами **777** и владельцем **prometheus**.
16. Чтобы система Linux поняла, что файл сервиса **Unit** добавлен в автозапуск, нужно вбить команду - **sudo systemctl daemon-reload**:
    - Тем самым обновляя директорию **systemd** до актуального состояния
    - Читаем подробно в **ИИ Qwen** про эту команду и заодно еще раз про пороцессы и демоны
18. Далее запускаем сервис **Prometheus** утилитой **systemctl** (в дефолте эта утилита смотрит в автозапуск **systemd** и будет знать о том, что там лежит наш юнит):
    - Проверяем после запуска статус **ACTIVE** командой - **sudo systemctl status prometheus.service** и смотрим на работающую веб-морду
    - А если **INACTIVE** или **FAIL**, то сразу читаем логи (смотрим следующий пункт темы)
    - Подсказка: смотрим в **Unit** либо смотрим в конфиг **YAML** в **Prometheus**, скорее всего ошиблись в одном из двух, часто бывают проблемы с выдачей прав и с неверными пользователями
    - Не забываем о том, что выдаем права и выставляем пользователей рекурсивно на всю директорию **/opt**
20. Затем выводим логи **Prometheus** в терминал, которые отбрасывает запущенный **Prometheus** с помощью утилиты **journalctl**:
    - Параллельно с помощью **Qwen** читаем, что такое: **stdin**, **stdout**, **stderr** 
22. Далее парсим (фильтруем) логи утилитой **grep** в файл **prometheus.log** по ключевому слову **info**:
    - То есть конечный результат лога должен содержать только строки с info
    - Подсказка: **journalctl | grep** - используем перенаправление вывода из **journalctl** в **grep** с помощью пайпа - **|**
    - А также подумайте, как с помощью **grep**:
       - Добавить новые записи в файл с сохранением в реальном времени (то есть не через однократное сохранение лога в файл) 
       - Грепать новые логи раз в минуту, записывая в файл:
          - Поставить мини-скрипт **grep** в планировщик **crontab** на выполнение (подсказка: 0 * * * * /путь/к/save_logs.sh - то есть **crontab** должен будет дёргать ваш мини-скрипт на выполнение раз в минуту):
             - Советую потренироваться в запуске вашего первого скрипта
             - К примеру для начала разобраться какие права ему выдать, чтобы он запустился с тестовой фразой в терминале: Hello, World!!! 
24. Далее перезагружаем **Ubuntu-виртуалку** и проверяем автозапуск (**sudo systemctl status prometheus.service**), что юнит автоматически стартовал сервис **Prometheus** - он должен подняться на веб-морде.
25. Далее, так как мы подняли **Prometheus** и он работает — пробежимся по дебагу (просто представим, что приложению нужен дебаг, а-ля это инцидент в банке и его нужно решать, а **Прометей** у нас не работает):
    
    - С помощью утилиты **ss** найдите **prometheus** и посмотрите на каком порту он сидит, заодно посмотрите какой это порт: **TCP** или **UDP**
    - С помощью утилиты **telnet** проверьте доступность соединения **Prometheus** по дефолтному порту **Prometheus** (подумайте как это сделать)
    - С помощью утилиты — **curl** гетом (**GET**) скурлите (постучитесь GET-запросом) в **API Prometheus**, который должен вернуть **HTTP статус 2xx**, если сервису хорошо и **HTTP статус 5xx**, если плохо (заодно подтягиваем тему: методы и коды **HTTP**)
    - С помощью команды **ps** найдите **PID** процесса **Prometheus** (подсказка: ps aux | grep ...) и попробуйте убить его командой **kill** (сначала прочитайте, как убивать процессы, сначала во встроенном руководстве **man**, а потом в **Qwen**)
    - А также в дебаг входит **journactl** и **systemctl status**
    - Команды можно комбинировать между собой

26. Далее написать **Bash** скрипт, начиная с пункта скачивания **Prometheus** по ссылке до полноценного старта сервиса **Prometheus**:
    - Этот скрипт в финале должен поднять **Prometheus** с нуля за секунды и вы должны увидеть в терминале статус сервиса **ACTIVE**, а затем пойти в браузер и увидеть его на веб-морде:
       - То есть ставим всё что мы делали вручную выше на автоматизацию
    - Далее нужно модернизировать этот скрипт на полное удаление **Prometheus** из системы, включая юнит, только осторожнее с директорией **/opt** - ее удалять не нужно
    - Писать эти скрипты строго используя логические операторы **&&** (и) и **||** (или):
       - То есть каждая строка скрипта должна выглядеть, как удаление директории **&&** вывод сообщения об успехе **||** вывод сообщения об ошибке:

                        rm -rf /tmp/example && echo "Директория успешно удалена" || { echo "Ошибка удаления директории"; exit 1; }

    - Далее протестировать эти два скрипта на текущей машине
30. Далее перейти в виртуальную машину **Ubuntu** (Б) из **п.1** и запустить её рядом с вашей машиной **Ubuntu** (А).
31. Прогнать из пункта выше готовый скрипт запуска **Prometheus** на голой машине Б:
    - Затем удалить **Prometheus** вторым скриптом (не забываем стопнуть **Prometheus** перед удалением, а после удаления сделать **daemon-reload**)
33. Подумать, как установить между этими двумя тачками **А** и **Б** соединение **SSH**, чтобы можно было ходить из одной машины в другую:
    - Подсказка: потренироваться генерить **SSH ключи** и понять, что такое публичный и закрытый ключи
34. Далее модернизировать старый **Bash** скрипт для архивации **Prometheus**:
    - Можно взять старые файлы из-под запущенного **Prometheus**, предварительно стопнув его, и очистив вручную директорию **/data** перед архивацией - это данные, которые успел записать **Prometheus** себе "под ноги" (для миграции мы не будем брать данные в расчет, потому что это занимает время, поэтому чистим директорию **/data**)
    - Начните архивацию  
37. Далее подумать, как с помощью утилиты **SCP** перекинуть этот архив **Prometheus** с тачки **А** на тачку **Б**:
    - Нужно иметь ввиду, что перекидывать архив лучше всего в директорию **/tmp** (прочитайте за что она отвечает)
39. Далее нужно написать скрипт на распаковку архива и установку **Prometheus** с последующим запуском, чтобы при распаковке на новой тачке автоматом выставлялись права и нужный пользователь на директорию **/opt** рекурсивно (тут важно помнить, что пользователя и группы пользователей **Prometheus** на голой машине ещё не существует, как и юнита)
    - Запустите скрипт по установке из архива на новой машине
- В Сбербанке эта задача (здесь она слегка модернизирована) была моим первым кейсом на должности разработчика мониторинга. На задачу мне дали максимум 3 дня. На третий день уже была миграция. **Мой уровень был**: умею создавать файлы, переходить в директории, запускаю скрипты (не пишу), знаю как сохранить файл и выйти из Vim, знаю как выставлять права на файлы и распаковываю архивы.
