# README
Тестовое задание лежит в корне репозитория.
Проект задеплоен по адресу:

[Salt Edge App](https://saltedge-app.onrender.com) (возможно придется подождать пару минут, пока приложение выйдет из анабиоза, аккаунт для деплоя бесплатный)

тестовый логин:

```review@test.email```

пароль:

```qwerty```

либо зарегистрируйте собственного пользователя.

При регистрации нового пользователя триггерится создание соответствующего ему кастомера в методе

__create__ контроллера __users/registrations_controller.rb__

Вся логика создания Customer, Connection, затем импорта соответствующих аккаунтов и транзакций
реализована через сервисные объекты:

```app/services/saltedge/customer/creator.rb```

```app/services/saltedge/connection/creator.rb```

```app/services/saltedge/connection/importer.rb```

```app/services/saltedge/connection/remover.rb```

```app/services/saltedge/connection/reconnector.rb```

```app/services/saltedge/connection/refresher.rb```

```app/services/saltedge/accounts/importer.rb```

```app/services/saltedge/transactions/importer.rb```

тесты соответственно:

```rspec spec/services/saltedge/customer/creator_spec.rb```

```rspec spec/services/saltedge/connections/creator_spec.rb```

```rspec spec/services/saltedge/connections/importer_spec.rb```

```rspec spec/services/saltedge/connections/remover_spec.rb```


  Взаимодействие с Salt Edge API происходит через выделенный класс SaltedgeGateway:

  ```app/gateways/saltedge_gateway.rb```

тесты для него можно запустить здесь:

  ```rspec spec/gateways/saltedge_gateway_spec.rb```

Рефрешинг connections запускается background job RefreshingConnectionsJob

по расписанию в 00:05 каждую ночь, адаптер good_job

настройка расписания в config/application.rb

Коллбэки обрабатываются через контроллер

```app/controllers/callbacks_controller.rb```

после проверки сигнатуры дальнейшая обработка полученных параметров колбека

передается в сервисный объект

```app/services/callbacks/handler.rb```
