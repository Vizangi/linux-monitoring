# Навигация

- _Этот документ является центральным навигатором по всем разделам курса (разделы выполняются последовательно)._
- _Теория и вопросы к собеседованию с полными ответами находятся в директориях соответствующих инструментов._
- _Объему содержания не пугаемся, так как оно здесь носит еще и информационно-развернутый характер._

---

## Содержание

_Roadmap / Дорожная карта_

1. **Теория и фундаментальные основы**
    * [Изучаем необходимую теорию](https://teletype.in/@lamjob/wjNvt64l77l)
    * [Изучаем теорию и практику по Linux](https://teletype.in/@lamjob/SsV-puwmQlR)

2.  **Введение в мониторинг и общие концепции**
    * [Предисловие](https://github.com/lamjob1993/linux-monitoring/blob/main/navigation/others/%D0%9F%D1%80%D0%B5%D0%B4%D0%B8%D1%81%D0%BB%D0%BE%D0%B2%D0%B8%D0%B5%20%D0%BA%20%D0%BA%D1%83%D1%80%D1%81%D1%83.md)
    * [Введение в мониторинг](https://github.com/lamjob1993/linux-monitoring/tree/main/navigation/introduction_monitoring)
       * **Учим сразу** базовую концепцию и закрепляем по мере прохождения курса
    * [Наш технический стек](https://github.com/lamjob1993/linux-monitoring/blob/main/navigation/others/%D0%A1%D1%82%D0%B5%D0%BA%20%D0%BE%D1%82%D0%B4%D0%B5%D0%BB%D0%B0.md)
    * [Кто такой инженер по сопровождению](https://teletype.in/@lamjob/B9uUuCqXaTu)
    * [Легенда инженера по сопровождению](https://github.com/lamjob1993/linux-monitoring/blob/main/navigation/others/%D0%9B%D0%B5%D0%B3%D0%B5%D0%BD%D0%B4%D0%B0%20%D0%B8%D0%BD%D0%B6%D0%B5%D0%BD%D0%B5%D1%80%D0%B0.md)
       * **Учим сразу** легенду и закрепляем по мере прохождения курса
    * [Пишем публичный репозиторий (pet-проект)](https://github.com/lamjob1993/linux-monitoring/blob/main/navigation/public_repository/README.md)
       * **Драфты по pet-проекту** должны быть готовы после прохождения раздела **"Prometheus. Мониторинг в базовом исполнении"**
       * **Pet-проект** должен быть готов на 100% по ссылке на [GitHub](https://github.com/) после прохождения раздела Docker: после темы **"Docker Compose"**
       * [Pet-проекты в качестве примеров (финтех тематика)
](https://github.com/lamjob1993/linux-monitoring/blob/main/navigation/public_repository/example-pet.md)
    
3. **Вопросы к собеседованию**
    * [Вопросы к собеседованию по легенде инженера](https://github.com/lamjob1993/linux-monitoring/blob/main/navigation/others/%D0%92%D0%BE%D0%BF%D1%80%D0%BE%D1%81%D1%8B%20%D0%BA%20%D0%BB%D0%B5%D0%B3%D0%B5%D0%BD%D0%B4%D0%B5.md)
       * **Учим сразу** вопросы и закрепляем по мере прохождения курса
    * [Технические вопросы к собеседованию без ответов](https://github.com/lamjob1993/linux-monitoring/blob/main/navigation/others/%D0%92%D0%BE%D0%BF%D1%80%D0%BE%D1%81%D1%8B%20%D0%B1%D0%B5%D0%B7%20%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D0%BE%D0%B2.md)
       * **Учим строго сразу**: Linux → Сети → Docker → это три основных кита для прохождения собеседования
       * **Учим позже после**: Linux → Сети → Docker и углубляемся в вопросы после Docker по мере прохождения курса: Terraform → Ansible → CI/CD → K8s
       * **Вопросы специально** написаны без ответов, чтобы вы сами их искали и тем самым готовились и запоминали
    * [Подготовка к собеседованию по аналитике вашего резюме](https://github.com/lamjob1993/linux-monitoring/blob/main/navigation/cv_final/README.md)
       * **Приступаем к этому разделу** после того, как я [утвердил ваше резюме на финал](https://t.me/c/2168307578/253/257)
    * Золотая база к собеседованию (в работе)

4. **Установка ОС и первая практика**
    * [Установка Linux](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/linux_install)
    * [Технические вопросы к собеседованию: Debian и CentOS](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/linux_install/tech_questions.md)
    * [Настройка доступа по SSH в GitHub](https://github.com/lamjob1993/linux-monitoring/blob/main/.files/%D0%93%D0%B5%D0%BD%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20SSH%20%D0%B4%D0%BB%D1%8F%20GitHub.md)
    * [Делаем форк этого репозитория к себе в аккаунт GitHub](https://github.com/lamjob1993/linux-monitoring/blob/main/.files/%D0%A4%D0%BE%D1%80%D0%BA%20%D0%B2%20GitHub.md)

5.  **Prometheus. Мониторинг в базовом исполнении**
    * [Путь Прометея](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/prometheus/README.md)
       * [Введение в Prometheus](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/prometheus/beginning)
       * [Prometheus Tasks](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/prometheus)
       * [Вопросы к интервью](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/prometheus/job_interview.md)
    * [Grafana - Визуализация и дашборды. Часть 1](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/grafana/README.md)
       * [Grafana Task 1](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/grafana)
       * Вопросы к интервью
    * Экспортеры Prometheus:
       * [Node Exporter](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/node-exporter/README.md)
          * [Node Exporter Tasks](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/node-exporter)
          * Вопросы к интервью
       * [Process Exporter](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/process-exporter/README.md)
          * [Process Exporter Tasks](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/process-exporter)
          * Вопросы к интервью
       * [Custom Exporter](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/custom_exporter_bash/README.md)
          * [Custom Exporter Tasks](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/custom_exporter_bash)
          * Вопросы к интервью
       * [Blackbox Exporter и Nginx](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/blackbox-exporter/README.md)
          * [Blackbox Exporter и Nginx Tasks](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/blackbox-exporter)
          * [Вопросы к интервью Blackbox](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/blackbox-exporter/blackbox_interview.md)
          * [Вопросы к интервью Nginx](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/blackbox-exporter/nginx_interview.md)
       * Postgres Exporter и PostgreSQL
          * [PostgreSQL](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/postgresql/README.md)
          * [Postgres Exporter](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/postgresql/README.md#%D1%87%D1%82%D0%BE-%D1%82%D0%B0%D0%BA%D0%BE%D0%B5-postgres-exporter-%D0%B8-%D0%B7%D0%B0%D1%87%D0%B5%D0%BC-%D0%BD%D1%83%D0%B6%D0%B5%D0%BD)
          * [PostgreSQL Tasks](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/postgresql)
          * [Вопросы к интервью](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/postgresql/job_interview.md)
    * [Pushgateway](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/pushgateway)
       * [Pushgateway Tasks](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/pushgateway/tasks_1.md)
       * Вопросы к интервью
    * [Prometheus Federation](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/prometheus_federate)
       * [Prometheus Federation Tasks](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/prometheus_federate/tasks_1.md)
       * Вопросы к интервью
    * [Alertmanager и алерты](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/alertmanager)
       * [Alertmanager Tasks](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/alertmanager/tasks_1.md)
       * Вопросы к интервью
    * [Grafana - Визуализация и дашборды. Часть 2](https://github.com/lamjob1993/linux-monitoring/blob/main/tasks/grafana/README.md)
       * [Grafana Task 2](https://github.com/lamjob1993/linux-monitoring/tree/main/tasks/grafana)
       * Вопросы к интервью
    * [Готовим драфт по pet-проекту](https://github.com/lamjob1993/linux-monitoring/blob/main/navigation/public_repository/README.md)
       * [Pet-проекты в качестве примеров (финтех тематика)
](https://github.com/lamjob1993/linux-monitoring/blob/main/navigation/public_repository/example-pet.md)

6.  **Docker. Контейнеризация**
    * [Docker - Основы, образы, контейнеры](https://github.com/lamjob1993/docker-monitoring)
    * Вопросы к интервью
    * [Пишем финальный pet-проект и публикуем](https://github.com/lamjob1993/linux-monitoring/blob/main/navigation/public_repository/README.md)
    * [Pet-проекты в качестве примеров (финтех тематика)
](https://github.com/lamjob1993/linux-monitoring/blob/main/navigation/public_repository/example-pet.md)

7.  **Terraform. Развертывание и управление инфраструктурой как кодом (IaC)**
    * [Terraform - Основы и провайдеры](https://github.com/lamjob1993/terraform-monitoring) / В работе
    * Вопросы к интервью

8.  **Ansible. Развертывание и управление конфигурацией и приложениями как кодом (IaC)**
    * [Ansible - Основы, инвентарь, модули](https://github.com/lamjob1993/ansible-monitoring/tree/main)
    * Вопросы к интервью

9.  **CI/CD**
    * [CI/CD - Общие принципы](../CI-CD/general_principles.md) / В работе
    * [Teamcity - Конфигурация и пайплайны](../CI-CD/Teamcity/interview_questions.md) / В работе
    * [BitBucket - Pipelines](../CI-CD/Bitbucket/interview_questions.md) / В работе
    * Вопросы к интервью 
    * ...
10. **Kubernetes. Оркестрация контейнеров**
    * [Kubernetes - Введение](https://github.com/lamjob1993/kubernetes-monitoring)
    * [Kubernetes - Архитектура и компоненты](../Kubernetes/interview-questions/kubernetes_architecture.md) / В работе
    * [Kubernetes - Поды, Deployments, Services](../Kubernetes/interview-questions/kubernetes_objects1.md) / В работе
    * Вопросы к интервью
    * ...
11. **Финальная часть**
    * Дипломный (выпускной pet-проект)
    * Добавить раздел по безопасности
    * Самопрезентация на собеседовании (презентация вашего pet-проекта собеседующему)
       * Изначально я веду собеседование и вы мне презентуете свой pet-проект
       * На реальном собеседовании стараемся выбить время в процессе, когда они у вас спросят, есть еще какие-то вопросы?
       * Демонстрация схемы проекта строго обязательна (давайте попробуем выбрать Figma, как основную площадку для рисовки)

