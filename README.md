# OiMenu Delphi SDK

## Documentação

Link para a documentação atualizada: [https://developers.oimenu.com.br](https://developers.oimenu.com.br)

## Instalação Manual

É possível baixar a última versão em [latest release](https://github.com/oimenu/oimenu-delphi/releases).
Para utilizar o OiMenu SDK, descompacte o arquivo baixado na pasta de seu projeto e também inclua o arquivo OiMenuUtil.pas.


## Dependências

O OiMenu SDK necessita que as seguintes bibliotecas estejam adicionadas ao seu projeto para funcionar corretamente:

- [`libeay32.dll`]
- [`ssleay32.dll`]

## Utilizando o SDK

Um exemplo de uso do SDK é:

```delphi
// listar pedidos pendentes
var
  apiParameter : TRequestParam;
  orderResult : TOrderResult;
  order : TOrder;
  x: Integer;
begin
  apiParameter := TRequestParam.create;
  apiParameter.token := 'OIMENU-TOKEN';
  apiParameter.customUrl := '';
    
  orderResult := getAllOrders(apiParameter);

  if (orderResult.success) then
  begin
    for x := 0 to orderResult.data.Count - 1 do
    begin
      order := orderResult.data.Items[x];
    end;
  end else begin
    //ERRO
  end;
end;

// cadastrar um produto do ERP
var
  apiParameter : TRequestParam;
  productResult : TProductResult;
  product : TProduct;
begin

  apiParameter := TRequestParam.create;
  apiParameter.token := 'OIMENU-TOKEN';
  apiParameter.customUrl := '';
    
  product := TProduct.Create;
  product.code := '1006';
  product.name := 'Chopp da Casa 600ml';
  product.price := 6.50;
  product.extraFields := '{"any_field":1}';

  productResult := createProduct(apiParameter, product);

  
  if (productResult.success) then
  begin
    //
  end else begin
    //
  end;
end;
```
