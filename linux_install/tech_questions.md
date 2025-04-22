# **Базовые технические вопросы по Debian и CentOS к собеседованию**

Таблица с вопросами и ответами для **Debian** и **CentOS**:

---

| **Вопрос**                                      | **Debian**                                                                 | **CentOS**                                                                 |
|-------------------------------------------------|---------------------------------------------------------------------------|---------------------------------------------------------------------------|
| **1. Как обновить систему?**                    | `sudo apt update && sudo apt upgrade`                                     | `sudo yum update` или `sudo dnf update`                                   |
| **2. Как установить пакет?**                    | `sudo apt install <package-name>`                                        | `sudo yum install <package-name>` или `sudo dnf install <package-name>`   |
| **3. Как удалить пакет?**                       | `sudo apt remove <package-name>`                                         | `sudo yum remove <package-name>` или `sudo dnf remove <package-name>`     |
| **4. Как полностью удалить пакет (с конфигами)?**| `sudo apt purge <package-name>`                                          | `sudo yum remove <package-name>` (удаляет всё, включая конфиги)           |
| **5. Как проверить статус службы?**             | `sudo systemctl status <service-name>`                                   | `sudo systemctl status <service-name>`                                   |
| **6. Как запустить службу?**                    | `sudo systemctl start <service-name>`                                    | `sudo systemctl start <service-name>`                                    |
| **7. Как добавить службу в автозапуск?**         | `sudo systemctl enable <service-name>`                                   | `sudo systemctl enable <service-name>`                                   |
| **8. Как отключить службу в автозапуске?**       | `sudo systemctl disable <service-name>`                                  | `sudo systemctl disable <service-name>`                                  |
| **9. Как посмотреть логи системы?**              | `journalctl -xe`                                                         | `journalctl -xe`                                                         |
| **10. Как создать нового пользователя?**         | `sudo adduser <username>`                                                | `sudo useradd <username>`                                                |
| **11. Как задать пароль пользователю?**          | `sudo passwd <username>`                                                 | `sudo passwd <username>`                                                 |
| **12. Как добавить пользователя в группу?**      | `sudo usermod -aG <group-name> <username>`                               | `sudo usermod -aG <group-name> <username>`                               |
| **13. Как настроить SSH-ключевую аутентификацию?**| `ssh-keygen`, затем `ssh-copy-id user@server-ip`                          | `ssh-keygen`, затем `ssh-copy-id user@server-ip`                          |
| **14. Как проверить использование дискового пространства?** | `df -h`                                                              | `df -h`                                                                  |
| **15. Как проверить использование оперативной памяти?** | `free -m` или `htop`                                                | `free -m` или `htop`                                                     |
| **16. Как настроить файрвол?**                   | `sudo ufw allow 80/tcp`, затем `sudo ufw enable`                         | `sudo firewall-cmd --add-port=80/tcp --permanent`, затем `sudo firewall-cmd --reload` |
| **17. Как изменить права доступа к файлу?**      | `chmod <permissions> <file>`                                             | `chmod <permissions> <file>`                                             |
| **18. Как изменить владельца файла?**            | `sudo chown <new-owner>:<new-group> <file>`                              | `sudo chown <new-owner>:<new-group> <file>`                              |
| **19. Как проверить открытые порты?**            | `netstat -tuln` или `ss -tuln`                                           | `netstat -tuln` или `ss -tuln`                                           |
| **20. Как настроить SELinux/AppArmor?**          | `sudo aa-status` или `sudo aa-enforce /path/to/profile`                  | `sestatus`, затем `sudo setenforce 0` или редактирование `/etc/selinux/config` |
| **21. Как посмотреть версию ОС?**                | `lsb_release -a`                                                         | `cat /etc/redhat-release`                                                |
| **22. Как перезагрузить систему?**               | `sudo reboot`                                                            | `sudo reboot`                                                            |
| **23. Как остановить службу?**                   | `sudo systemctl stop <service-name>`                                     | `sudo systemctl stop <service-name>`                                     |
| **24. Как проверить загруженные модули ядра?**   | `lsmod`                                                                  | `lsmod`                                                                  |
| **25. Как добавить репозиторий?**                | `sudo add-apt-repository <repo-url>`                                     | `sudo yum-config-manager --add-repo <repo-url>`                          |

---

### Примечания:
- **Debian** использует `apt` для управления пакетами и `ufw` для файрвола.
- **CentOS** использует `yum` или `dnf` для управления пакетами и `firewalld` для файрвола.
- Некоторые команды (например, `systemctl`, `journalctl`) работают одинаково в обоих дистрибутивах.

---

## Как вы использовали Debian и CentOS на практике и какие кейсы с ними были?

### **1. Как Debian и CentOS использовались в вашей работе?**
**Пример ответа:**  
"Я использовал Debian и CentOS для развертывания серверов, контейнеризации приложений, управления инфраструктурой и настройки мониторинга. Debian часто применялся для веб-серверов и приложений благодаря его стабильности и большому сообществу. CentOS использовался для корпоративных решений, где важна совместимость с RHEL (Red Hat Enterprise Linux)."

---

### **2. Какие команды вы использовали для работы с Debian и CentOS?**
**Пример ответа:**

#### **Управление пакетами:**
- **Debian (APT):**
  ```bash
  sudo apt update
  sudo apt install <package-name>
  sudo apt remove <package-name>
  sudo apt upgrade
  ```
- **CentOS (YUM/DNF):**
  ```bash
  sudo yum install <package-name>
  sudo yum remove <package-name>
  sudo yum update
  ```

#### **Настройка служб:**
- **Запуск и управление службами:**
  ```bash
  sudo systemctl start <service-name>
  sudo systemctl enable <service-name>
  sudo systemctl status <service-name>
  ```

#### **Работа с файловой системой:**
- **Создание и редактирование файлов:**
  ```bash
  sudo nano /etc/nginx/nginx.conf
  sudo chmod 644 /path/to/file
  sudo chown user:group /path/to/file
  ```

#### **Мониторинг системы:**
- **Проверка нагрузки и ресурсов:**
  ```bash
  top
  htop
  df -h
  free -m
  ```

#### **Настройка сети:**
- **Просмотр сетевых интерфейсов:**
  ```bash
  ip addr show
  netstat -tuln
  ```
- **Настройка файрвола (iptables или firewalld):**
  ```bash
  sudo ufw allow 80/tcp
  sudo firewall-cmd --add-port=80/tcp --permanent
  sudo firewall-cmd --reload
  ```

---

### **3. Какие каверзные вопросы могут возникнуть и как на них ответить?**

#### **Вопрос: Почему вы выбрали Debian вместо CentOS (или наоборот)?**
**Ответ:**  
"Выбор зависел от задачи. Для веб-приложений я предпочитал Debian из-за его простоты и богатого репозитория пакетов. Для корпоративных решений, таких как базы данных или высоконагруженные серверы, я выбирал CentOS, так как он обеспечивает долгосрочную поддержку и совместимость с RHEL."

#### **Вопрос: Как вы решали проблемы с зависимостями пакетов?**
**Ответ:**  
"Если возникали конфликты зависимостей, я:
- Проверял логи установки (`/var/log/apt/` для Debian или `/var/log/yum.log` для CentOS).
- Использовал команду `apt-cache policy` или `yum deplist` для анализа зависимостей.
- При необходимости устанавливал пакеты вручную или добавлял сторонние репозитории."

#### **Вопрос: Как вы обеспечивали безопасность системы?**
**Ответ:**  
"Для безопасности я:
- Настроил SSH-ключевую аутентификацию и отключил пароли.
- Обновлял систему регулярно (`apt upgrade` или `yum update`).
- Настроил файрвол (UFW для Debian, Firewalld для CentOS).
- Установил и настроил SELinux (для CentOS) или AppArmor (для Debian)."

#### **Вопрос: Как вы решали проблему с производительностью системы?**
**Ответ:**  
"Я анализировал нагрузку через `top`, `htop` и `iotop`. Если CPU или память были перегружены, я:
- Оптимизировал конфигурации сервисов (например, Nginx, MySQL).
- Добавлял swap или увеличивал ресурсы сервера.
- Использовал инструменты мониторинга, такие как Prometheus и Node Exporter."

---

### **4. Пример успешного кейса использования Debian/CentOS**
**Пример ответа:**  
"Однажды нам нужно было развернуть высоконагруженный веб-сервер. Мы выбрали Debian для фронтенда (Nginx) и CentOS для базы данных (PostgreSQL). Я:
1. Настроил автоматическое обновление пакетов для безопасности.
2. Развернул Nginx с SSL/TLS через Let's Encrypt.
3. Настроил PostgreSQL с репликацией для отказоустойчивости.
4. Интегрировал мониторинг через Prometheus и Grafana.

Это позволило нам обеспечить стабильность и производительность системы даже при высокой нагрузке."

---

### **5. Что ещё можно добавить?**

- **Автоматизация управления серверами:**  
  "Для автоматизации я использовал Ansible. Например, создавал плейбуки для установки и настройки Nginx, Docker или мониторинга."

- **Работа с контейнерами:**  
  "Я разворачивал Docker и Kubernetes на обоих дистрибутивах. Для Debian использовал официальные репозитории, а для CentOS — пакеты из EPEL."

- **Логирование и отладка:**  
  "Для анализа логов я использовал `journalctl` (для systemd) и инструменты, такие как `grep` и `awk`. Также настраивал централизованный сбор логов через Loki."

- **Миграция между дистрибутивами:**  
  "Если требовалась миграция с Debian на CentOS (или наоборот), я:
  - Экспортировал данные (например, базы данных или конфигурации).
  - Тестирую работу приложений на новом дистрибутиве.
  - Автоматизировал процесс через скрипты."
