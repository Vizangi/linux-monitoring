# Настройка и запуск Alertmanager для Prometheus
_Пользуемся официальной документацией на GitHub (в основном там прописаны Docker файлы на запуск и всегда есть конфиги)_
## Tasks

 - Установите `Alertmanager` в систему
 - При этом упростите установку `Alertmanager` - после распаковки архива сделайте директорию распаковки рабочей сразу, чтобы не повторять шаги способом установки `Prometheus`
 - Подумайте, как настроить конфиг `Alertmanager`
 - Проверьте, что `Alertmanager` поднялся на веб-морде
 - По заданию вам нужно, чтобы в `Телеграм` приходили алерты 
 - Сделайте сначала один алерт на превышение нагрузки ЦП на 80%
    - Затем сделайте еще несколько алертов и подумайте на какую тему
 - Самостоятельно выведите метрики, отвечающие за файринг (срабатывание) алертов на дашборд
 - Сделайте виджеты, которые будут показывать текущую нагрузку, к примеру, на ЦП
    - Используйте агрегирующие функции и функции анализа динамики изменений
 - Сохраните дашборд и изменения
