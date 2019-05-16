# Описание скриптов Terraform
## Оглавление
- [Структура каталога](#structure)
- [Storage](#storage)
- [Модули](#modules)
    - [app](#app)
    - [ci](#ci)
    - [monitor](#monitor)
    - [vpc](#vpc)
- [Основные скрипты](#general)

## Структура каталога <a name="structure"></a>
Все скрипты по созданию инфраструктуры содержатся в каталоге **terraform/**:
- в корне каталога содержатся основные скрипты по созданию инфраструктуры;
- в папке **modules/** содержатся модули Terraform;
- в папке **storage/** содержатся скрипты по созданию облачного хранилища для state-файлов.

## Storage <a name="storage"></a>
#### main.tf
- Создание хранилища **devops-project-storage-bucket**.
- Параметр `force_destroy = true` позволяет удалять хранилище, даже если оно непустое.

#### outputs.tf
Выходная переменная:
- `backend-store` — название хранилища.

#### terraform.tfvars.example
Здесь задаётся значение переменной `project` — имя проекта в GCP. Необходимо подставить имя своего проекта и переименовать файл в **terraform.tfvars**.

#### variables.tf
Инициализация переменных:
- `project` — имя проекта в GCP;
- `region` — регион. Значение по умолчанию: **europe-west1**.

## Модули <a name="modules"></a>
### app <a name="app"></a>
#### main.tf
- Создание двух виртуальных машин: **prod** для рабочего окружения и **stage** для тестового окружения:
    - 1 vCPU;
    - 3,75 GB memory;
    - 20 GB HDD;
    - CentOS 7.
- Обе машины помещаются в сеть, созданную в модуле **vpc**.
- Для обеих машин создаётся внешний статический IP-адрес.
- Обеим машинам присваиваются теги `devops` и `devops-app`.

#### outputs.tf
Выходные переменные:
- `prod_external_ip` — внешний IP-адрес машины **prod**;
- `stage_external_ip` — внешний IP-адрес машины **stage**.

#### variables.tf
Инициализация переменных:
- `zone` — зона;
- `app_machine_type` — тип виртуальной машины;
- `app_disk_image` — образ, из которого создаётся виртуальная машина;
- `app_disk_type` — тип диска;
- `app_disk_size` — размер диска.
- `network` — название сети.

### ci <a name="ci"></a>
#### main.tf
- Создание виртуальной машины **ci** для процесса CI/CD:
    - 1 vCPU;
    - 3,75 GB memory;
    - 100 GB HDD;
    - CentOS 7.
- Машина помещается в сеть, созданную в модуле **vpc**.
- Для машины создаётся внешний статический IP-адрес.
- Машине присваиваются теги `devops` и `devops-ci`.

#### outputs.tf
Выходная переменная:
- `ci_external_ip` — внешний IP-адрес машины **ci**.

#### variables.tf
Инициализация переменных:
- `zone` — зона;
- `ci_machine_type` — тип виртуальной машины;
- `ci_disk_image` — образ, из которого создаётся виртуальная машина;
- `ci_disk_type` — тип диска;
- `ci_disk_size` — размер диска.
- `network` — название сети.

### monitor <a name="monitor"></a>
#### main.tf
- Создание виртуальной машины **monitor** для процесса сбора обратной связи:
    - 1 vCPU;
    - 3,75 GB memory;
    - 100 GB HDD;
    - CentOS 7.
- Машина помещается в сеть, созданную в модуле **vpc**.
- Для машины создаётся внешний статический IP-адрес.
- Машине присваиваются теги `devops` и `devops-monitor`.

#### outputs.tf
Выходная переменная:
- `monitor_external_ip` — внешний IP-адрес машины **monitor**.

#### variables.tf
Инициализация переменных:
- `zone` — зона;
- `monitor_machine_type` — тип виртуальной машины;
- `monitor_disk_image` — образ, из которого создаётся виртуальная машина;
- `monitor_disk_type` — тип диска;
- `monitor_disk_size` — размер диска.
- `network` — название сети.

### vpc <a name="vpc"></a>
#### main.tf
- Создание сети **devops-project-network**.
- Создание правила файервола **allow-devops-project-all**, которое для машин с тегом `devops` открывает порты:
    - 8000 — для приложения;
    - 80 — для HTTP запросов;
    - 443 — для HTTPS запросов;
    - 22 — для доступа по SSH
    - 2222 — резервный.
- Создание правила файервола **allow-devops-project-monitor**, которое для машин с тегом `devops-monitor` открывает порты:
    - 9090 — для Prometheus;
    - 3000 — для Grafana;
    - 9093 — для Alertmanager.
- Создание правила файервола **allow-devops-project-exporters**, которое для машин с тегом `devops-app` открывает порты:
    - 9100 — для Node Exporter;
    - 9419 — для RabbitMQ Exporter;
    - 8080 — для cAdvisor.

#### outputs.tf
Выходная переменная:
- `network` — ссылка на созданную сеть.

## Основные скрипты <a name="general"></a>
#### backend.tf
Здесь указано, что state-файлы содержатся в облачном хранилище **devops-project-storage-bucket**.

#### main.tf
Выполнение модулей:
- vpc;
- app;
- ci;
- monitor.

#### outputs.tf
Выходные переменные:
- `prod_external_ip` — внешний IP-адрес машины **prod**;
- `stage_external_ip` — внешний IP-адрес машины **stage**;
- `ci_external_ip` — внешний IP-адрес машины **ci**;
- `monitor_external_ip` — внешний IP-адрес машины **monitor**;
- `network` — ссылка на созданную сеть.

#### terraform.tfvars.example
Здесь задаётся значение переменной `project` — имя проекта в GCP. Необходимо подставить имя своего проекта и переименовать файл в **terraform.tfvars**.

#### variables.tf
Инициализация переменных:
- `project` — имя проекта в GCP;
- `region` — регион. Значение по умолчанию: **europe-west1**;
- `zone` — зона. Значение по умолчанию: **europe-west1-b**;
- `app_machine_type` — тип виртуальной машины для серверов **stage** и **prod**. Значение по умолчанию: **n1-standard-1**;
- `app_disk_image` — образ, из которого создаётся виртуальная машина  для серверов **stage** и **prod**. Значение по умолчанию: **centos-7**;
- `app_disk_type` — тип диска  для серверов **stage** и **prod**. Значение по умолчанию: **pd-standard**;
- `app_disk_size` — размер диска  для серверов **stage** и **prod**. Значение по умолчанию: **20**;
- `ci_machine_type` — тип виртуальной машины для сервера **ci**. Значение по умолчанию: **n1-standard-1**;
- `ci_disk_image` — образ, из которого создаётся виртуальная машина для сервера **ci**. Значение по умолчанию: **centos-7**;
- `ci_disk_type` — тип диска для сервера **ci**. Значение по умолчанию: **pd-standard**;
- `ci_disk_size` — размер диска для сервера **ci**. Значение по умолчанию: **100**;
- `monitor_machine_type` — тип виртуальной машины для сервера **monitor**. Значение по умолчанию: **n1-standard-1**;
- `monitor_disk_image` — образ, из которого создаётся виртуальная машина для сервера **monitor**. Значение по умолчанию: **centos-7**;
- `monitor_disk_type` — тип диска для сервера **monitor**. Значение по умолчанию: **pd-standard**;
- `monitor_disk_size` — размер диска для сервера **monitor**. Значение по умолчанию: **100**.

<br/>

[Вернуться на главную страницу](../README.md)
