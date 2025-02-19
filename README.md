# linux-monitoring

_Задание написано таким образом, что о тех инструментах, которые в нем используются, спрашивают более чем в 80% случаев на собеседовании по части Linux у джунов: DevOps, SRE, инженеров по сопровождению/мониторингу и администраторов Linux. Сразу всё задание со всеми пунктами через ChatGPT (Qwen) не прогоняем, иначе не пройдем собеседование (пользуемся только Qwen по точечным запросам, к примеру, как работает команда на выдачу прав, потому что это сильно быстрее, чем поиск в Google). Делаем пункты строго по очереди, не перепрыгиваем!_

По заданию мы вручную распакуем архив с бинарём системы мониторинга **Prometheus**, опишем его автозапуск файлом юнита (**Unit**) и проверим запуск **Prometheus** на веб-морде, параллельно проведя его дебаг. Далее напишем мини-автоматизацию этой рутины на **Bash** и сделаем тестовую миграцию на склонированную виртуальную машину **Ubuntu** (в будущих уроках затронем данную тему с помощью **Ansible**). В настройку сети и **iptables** углубляться не будем, так как у вас на работе будут готовые 50-100 тачек, на которых уже развёрнут софт и сетка уже давно растроена. Либо же будет условный кейс по миграции системы мониторинга и миграции чего угодно с серверов CentOS на голые Ubuntu Server или на голые SberLinux.

**Начало**

1. Изначально у вас должна быть установлена виртуалка Ubuntu 22.04. После установки склонируйте её и продолжайте работать на клоне (это нужно в целях резервирования).
2. Взять директорию из корня - **/opt** (является частью стандартной файловой системы и предназначена для хранения дополнительного программного обеспечения) и создать в ней директорию - **/monitoring** и склонировать в нее учебный репозиторий по выданной ссылке (подсказка: **git clone**).
3. Найти и скачать архив **.tar.gz** дистрибутива **Prometheus** для **Linux** самой последней второй (не третьей) версии в склонированную директорию **/opt/monitoring/linux-monitoring/prometheus/** (подсказка: GitHub, AMD64, bin).
4. Разархивировать архив и найти внутри директории бинарь **Prometheus** (директория после разархивации будет выглядеть, к примеру, вот так - **prometheus-2.53.2.linux-amd64**).
5. Проверить версию **Prometheus** (подсказка: **./prometheus --version**) и запустить бинарь "на коленке" (подсказка: **./bin/prometheus** или **./prometheus**).
6. Проверить запущенный на коленке **Прометей** (Прометеус) на веб-морде (подсказка: проверка должна быть в браузере на порту **:9090**, чтобы понять по какому ip адресу стучаться в **Прометеус**, нужно знать ip адрес интерфейса своей тачки).
7. Далее переходим в новую рабочую директорию - **/opt/monitoring/linux-monitoring/prometheus/** и постепенно будем наполнять ее нужными файлами из директории - **prometheus-2.53.2.linux-amd64**.
8. Далее создать директории - **/bin, /etc, /data, /consoles, /console_libraries**, внутри директории - **/opt/monitoring/linux-monitoring/prometheus/**.
9. Скопировать в **/bin** бинарь **Prometheus** (подсказка: **п.4**).
10. В директории **/etc** создать пустой файл - **prometheus.yml**, затем наполнить **prometheus.yml** дефолтным конфигом **Prometheus** (подсказка: **GitHub** - **prometheus/documentation/examples/prometheus.yml**, а также подумать, что означает этот конфиг построчно на пару с **Qwen GPT**).
11. Наполнить директории: **/data** - оставить пустой, **/consoles** - наполнить по аналогии с директорией - **prometheus-2.53.2.linux-amd64**, **/console_libraries** - наполнить по аналогии с директорией - **prometheus-2.53.2.linux-amd64**.
12. Далее создать пустой файл - **Unit** в корневой директории - **/prometheus** и наполнить (на сленге - написать) его для **Prometheus** (подсказка: логически понять, как назвать **Unit** файл (это будет файл сервиса **Prometheus**) и как он должен быть написан внутри).
13. Далее одной командой выдать права **777** на корневую директорию **/opt** и на все файлы внутри (это называется рекурсивно), в которой уже должны лежать файлы по структуре ниже (проверить результат выполнения команды): 

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

14. Обычно такие права **777** не выдаются (либо выдаются в песочнице), но у нас учебный проект, поэтому имеем это ввиду.
    - Параллельно идем в **ИИ GPT Qwen** и учимся выставлять числовые права.
    - Заодно будем понимать, что такое **777** и как эти числа образуются (**4+2+1**).
12. Далее нужно создать группу пользователей **prometheus** и добавить туда пользователя **prometheus**, далее проверить эту группу пользователей, что **prometheus** добавился (одновременно идем в **ИИ GPT Qwen** и учимся назначать владельца на директорию и на файлы), при дефолтной установке пакета **Prometheus**, будь то **.rpm** или **.deb** назначение прав и владельца происходят автоматически при установке любого пакета (здесь мы делаем это вручную, чтобы понимать логику работу команд: chown и chmod).
13. Затем рекурсивно назначить (изменить) владельца (пользователя) - **prometheus** для директории - **/opt** и для всех файлов внутри (проверить результат выполнения):

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

14. Затем скопировать **Unit** в директорию **/etc/systemd/system/** автозапуска Linux с уже выставленными правами **777** и владельцем **prometheus**.
15. Чтобы система Linux поняла, что файл сервиса добавлен в автозапуск, нужно вбить команду - **sudo systemctl daemon-reload**, тем самым обновляя директорию **systemd** до актуального состояния (читаем подробно в **ИИ Qwen** про эту команду и заодно еще раз про пороцессы и демоны).
16. Далее запускаем сервис **Prometheus** утилитой **systemctl** (в дефолте эта утилита смотрит в автозапуск **systemd** и будет знать о том, что там лежит наш юнит), проверяем после запуска статус **ACTIVE** командой - **sudo systemctl status prometheus.service** и смотрим на работающую веб-морду, а если **INACTIVE**, то сразу читаем логи (смотрим следующий пункт темы), чтобы понять почему **INACTIVE** (подсказка: смотрим в **Unit** либо смотрим в конфиг **YAML** в **Prometheus**, скорее всего ошиблись в одном из двух, часто бывают проблемы с выдачей прав и с неверными пользователями, не забываем о том, что выдаем права и выставляем пользователей рекурсивно на всю директорию **/opt**).
17. Затем выводим логи **Prometheus** в терминал (параллельно с помощью **Qwen** читаем что такое **stdin**, **stdout**, **stderr**), которые отбрасывает запущенный **Prometheus** с помощью утилиты **journalctl** (смотрим в **Qwen** как это сделать).
18. Далее парсим (фильтруем) логи утилитой **grep** в файл **logs.log** по ключевому слову **info** с верхним и нижним регистром, то есть конечный результат лога должен содержать только строки с info (подсказка: **journalctl | grep** - используем перенаправление вывода из **journalctl** в **grep** с помощью пайпа - **|**, а также подумайте, как с помощью **grep** сделать однократное сохранение лога, для добавления в лог новых записей и для работы в реальном времени).
19. Далее перезагружаем **Ubuntu-виртуалку** и проверяем автозапуск (**sudo systemctl status prometheus.service**), что юнит автоматически стартовал сервис **Prometheus** - он должен подняться на веб-морде.
20. Далее, так как мы подняли **Prometheus** и он работает — пробежимся по дебагу (просто представим, что приложению нужен дебаг, а-ля это инцидент в банке и его нужно решать, а **Прометей** у нас не работает):

    - С помощью утилиты **ss** найдите **prometheus** и посмотрите на каком порту он сидит, заодно посмотрите какой это порт: **TCP** или **UDP**.
    - С помощью утилиты **telnet** проверьте доступность соединения **Prometheus** по дефолтному порту Prometheus (подумайте как это сделать).
    - С помощью утилиты — **curl** гетом (**GET**) скурлите (постучитесь GET-запросом) в **API Prometheus**, который должен вернуть **HTTP статус 2xx**, если сервису хорошо и **HTTP статус 5xx**, если плохо (заодно подтягиваем тему: методы и коды **HTTP**).
    - А также в дебаг входит **journactl** и **systemctl status**.

21. Далее написать **Bash** скрипт, начиная с пункта 2 текущей темы до старта сервиса Prometheus, включая написанный **Unit** и конфиг **Prometheus** в директории **/bin**. Этот скрипт в финале должен поднять **Prometheus** с нуля за секунды и вы должны увидеть его на веб-морде (придумать в скрипте свои директории, к примеру **test_prometheus_2** (а-ля свой проект, к примеру **Prometheus_2**) и сложить файлы **Prometheus** туда).
22. Прогнать готовый скрипт (не забыть удалить юнит из автозапуска и стопнуть поднятый Prometheus, который уже поднимали).
23. На данном этапе сохранить ваши текущие изменения и выключить виртуалку.
24. Далее перейти в другую виртуальную машину **Ubuntu**, которая осталась рядом с клоном из **п.1** и запустить её рядом с вашим клоном **Ubuntu** одновременно.
25. Подумать, как установить между этими двумя тачками **А** и **Б** соединение **SSH**, чтобы можно было ходить из одной машины на другую (подсказка: потренироваться генерить **SSH ключи**). 
26. Далее подумать, как с помощью утилиты **SCP** перекинуть рабочий и подготовленный архив **Prometheus** с тачки **А** на тачку **Б** (подумайте, как запаковать его уже с выданными правами и конфигами, **Prometheus** должен быть готов к запуску по вашему скрипту на новой тачке (тачками называют машины и серверы - это синонимы)).
27. Финал. Прогнать готовый скрипт на виртуалке.
- В Сбербанке эта задача была моим первым кейсом на должности разработчика мониторинга. На задачу мне дали 2 дня. На третий день уже была миграция. **Мой уровень был**: умею создавать файлы, переходить в директории, запускаю скрипты (не пишу), знаю как сохранить файл и выйти из Vim, знаю как выставлять права на файлы и распаковываю архивы.
