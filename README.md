# Коллективный блог

[![hexlet-check](https://github.com/kicha3007-boop/rails-project-64/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/kicha3007-boop/rails-project-64/actions)
[![CI](https://github.com/kicha3007-boop/rails-project-64/actions/workflows/ci.yml/badge.svg)](https://github.com/kicha3007-boop/rails-project-64/actions/workflows/ci.yml)

Аналог Хабра: пользователи публикуют посты в общих категориях, комментируют их деревом ответов и ставят лайки.

Учебный проект Хекслета: https://ru.hexlet.io/programs/rails

## Стек

- Ruby 4.0, Ruby on Rails 8.1
- Devise — регистрация и вход
- Ancestry (`materialized_path2`) — дерево комментариев
- Tailwind CSS, ERB-шаблоны, Turbo
- SQLite в разработке и тестах, PostgreSQL в продакшене
- Minitest + power_assert + Faker, RuboCop (rails-omakase), herb-lint
- Sentry SDK для отправки ошибок в Bugsink (включается переменной `SENTRY_DSN`)

## Установка и запуск

```bash
git clone https://github.com/kicha3007-boop/rails-project-64.git
cd rails-project-64
make setup   # зависимости, сборка Tailwind, база и начальные категории
make start   # сервер на http://localhost:3000
```

## Разработка

```bash
make test    # тесты
make lint    # rubocop и herb-lint (нужен Node.js для npx)
```

## Деплой

Продакшен ожидает переменные окружения `DATABASE_URL` (PostgreSQL), `SECRET_KEY_BASE` и, по желанию, `SENTRY_DSN`.

<details>
<summary>Автоматические тесты Хекслета</summary>

Тесты запускаются на каждый коммит. За запуск отвечает файл `.github/workflows/hexlet-check.yml` — не удаляйте и не переименовывайте ни его, ни репозиторий.

</details>
