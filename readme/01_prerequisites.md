# Предварительные шаги
1. Установить все требуемые программы:
    - Git;
    - Terraform;
    - Ansible;
    - Google Cloud SDK.
2. Создать проект в Google Cloud Platform.
3. В метаданные проекта добавить публичные SSH-ключи пользователей, которые будут работать с инфраструктурой.
4. Создать Application Default Credentials для предоставления программе Terraform доступа к облачной инфраструктуре:
    ```bash
    $ gcloud auth application-default login
    ```

<br/>

Следующий шаг: [Создание инфраструктуры](02_infrastructure.md)

Предыдущий шаг: [Требования](00_requirements.md)

<br/>

[Вернуться на главную страницу](../README.md)
