# linux-monitoring

_Здесь будут задачи по Linux, мониторингу и автоматизации._

_Задание написано таким образом, чтобы понять 80% базы Linux, которой точно хватит для прохождения собеседования в части Linux!_

**Полностью через ChatGPT это задание не прогоняем! Иначе не пройдем собеседование по части Linux!** 

1. Взять за рабочую директорию **../home/name_user/Documents/** и склонировать в нее учебный репозиторий по выданной ссылке (подсказка: git clone)
2. Найти и скачать архив **.tar.gz** дистрибутива Prometheus для Linux самой последней второй (не третьей) версии в склонированную директорию **../home/name_user/Documents/monitoring_linux/prometheus/**, то есть в директорию prometheus (подсказка GitHub, AMD64, bin)
3. Разархивировать архив и найти внутри директории бинарь Prometheus
4. Проверить версию Prometheus (подсказка: **./prometheus --version**) и запустить бинарь "на коленке" (подсказка: **./bin/prometheus** или **./prometheus**)
5. Проверить запущенный на коленке Прометей (Прометеус) на веб-морде (подсказка: проверка должна быть в браузере на порту **:9090**, чтобы понять по какому ip адресу стучаться в Прометеус, нужно знать ip адрес интерфейса своей тачки)
6. Создать директорию - **/bin** внутри директории - **../home/name_user/Documents/monitoring_linux/prometheus/** и скопировать в нее бинарь Prometheus (который запускали на коленке)
7. Далее создать в директории - **/prometheus** пустой файл - **prometheus.yml**, затем наполнить этот файл дефолтным конфигом Прометея (подсказка: GitHub - **prometheus/documentation/examples/prometheus.yml**, а также подумать, что означает этот конфиг на пару с Qwen GPT)
8. Далее создать пустой файл Unit в директории - **/prometheus** и наполнить (на сленге - написать) его для Prometheus (подсказка: логически понять как назвать Unit файл (это будет файл сервиса Прометеуса) и как он должен быть написан внутри)
9. Далее выдать права 777 на директорию prometheus и на все файлы внутри (это называется рекурсивно), в которой уже должны лежать файлы: бинарь в директории **/bin**, конфиг Прометеуса и юнит Прометеуса (обычно такие права 777 не выдаются, но у нас учебный проект, поэтому имеем это ввиду (одновременно идем в ИИ GPT Qwen и учимся выставлять числовые права))
10. Далее создать группу пользователей prometheus и добавить туда пользователя prometheus, далее проверить эту группу пользователей, что prometheus добавился
11. Затем рекурсивно назначить (изменить) владельца (пользователя) для директории **/prometheus** и для всех файлов внутри
12. Затем скопировать Unit в директорию systemd автозапуска Linux с уже выставленными правами и пользователем
13. Далее запускаем сервис Prometheus утилитой systemctl, проверяем статус ACTIVE и смотрим на веб-морду, а если INACTIVE, то идем переписывать Unit либо смотрим конфиг YAML в Prometheus, скорее всего ошиблись в одном из двух (если конфиг YAML дефолтный, то дело не в нём), а также читаем логи (следующий пункт темы), чтобы понять почему INACTIVE
14. Затем выводим логи Prometheus в терминал (параллельно с помощью Qwen читаем что такое stdin, stdout, stderr), которые отбрасывает запущенный Prometheus с помощью утилиты journalctl
15. Далее парсим логи утилитой grep в файл logs.log по ключевому слову info с верхним и нижним регистром, то есть конечный результат лога должен содержать только строки с info (подсказка: journalctl | grep - используем перенаправление вывода из journalctl в grep)
16. Далее написать Bash скрипт (подсказка: не забыть выдать числовые права исполнения на скрипт), начиная с пункта 2 текущей темы до старта сервиса Prometheus. Этот скрипт в финале должен поднять Prometheus с нуля (придумать в скрипте свои директории, к примеру test_prometheus (а-ля свой проект) и сложить Prometheus туда)
17. Прогнать готовый скрипт (не забыть удалить юнит из автозапуска и стопнуть поднятый Prometheus, который уже поднимали)
