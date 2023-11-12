# README

Проект задеплоен по адресу:

[Salt Edge App](https://saltedge-app.onrender.com) (возможно придется подождать около минуты пока проект выйдет из спящего режима)

Вся логика создания Customer, Connection, затем импорта соответствующих аккаунтов и транзакций
реализована через сервисные объекты:

__app/services/saltedge/customer/creator.rb__

__app/services/saltedge/connection/creator.rb__

__app/services/saltedge/connection/importer.rb__

__app/services/saltedge/connection/remover.rb__

__app/services/saltedge/connection/reconnector.rb__

__app/services/saltedge/connection/refresher.rb__

__app/services/saltedge/accounts/importer.rb__
                        
__app/services/saltedge/transactions/importer.rb__

тесты соответственно:

```rspec spec/services/saltedge/customer/creator_spec.rb```

```rspec spec/services/saltedge/connections/creator_spec.rb```

```rspec spec/services/saltedge/connections/importer_spec.rb```

```rspec spec/services/saltedge/connections/remover_spec.rb```
  
  недостающие тесты сегодня постараюсь добить)

  Взаимодействие с Salt Edge API происходит через выделенный класс SaltedgeGateway:

  __app/gateways/saltedge_gateway.rb__

тесты для него можно запустить здесь:

  ```rspec spec/gateways/saltedge_gateway_spec.rb```

Рефрешинг connections запускается background job RefreshingConnectionsJob

по расписанию в 00:05 каждую ночь, адаптер good_job

настройка расписания в config/application.rb
