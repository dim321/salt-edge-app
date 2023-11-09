# README

Вся логика создания Customer, Connection, затем импорта соответствующих аккаунтов и транзакций
реализована через сервисные объекты:

__app/services/saltedge/customer/creator.rb__

__app/services/saltedge/connection/creator.rb__

__app/services/saltedge/connection/importer.rb__

__app/services/saltedge/connection/remover.rb__

__app/services/saltedge/accounts/importer.rb__
                        
__app/services/saltedge/transactions/importer.rb__

тесты соответственно:

```rspec spec/services/saltedge/customer/creator_spec.rb```
  
  недостающие тесты сегодня постараюсь добить)

  Взаимодействие с Salt Edge API происходит через выделенный класс SaltedgeGateway:

  __app/gateways/saltedge_gateway.rb__

тесты для него можно запустить здесь:

  ```rspec spec/gateways/saltedge_gateway_spec.rb```

Локально проект работает, сделал попытку задеплоить на fly.io, но на бесплатном аккаунте проект закрашился по причине нехватки памяти, порешаю вопрос с деплоем завтра. 