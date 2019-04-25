library oimenuapi;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  IdHTTP,
  Contnrs,
  uJSON in 'uJSON.pas';

{$R *.res}

  //SIMPLE RESULT
  type
    TSimpleResult = class
      success             : Boolean;
      message             : PChar;
      responseCode        : Integer;
      data                : PChar;
      count               : Integer;
  end;

  //ORDER
  type
    TOrderItemOption = class
      id                  : PChar;
      optionId            : PChar;
      code                : PChar;
      name                : PChar;
      quantity            : Integer;
      price               : Double;
      notes               : TStringList;
      extraFields         : PChar;

      constructor Create;
      Destructor Destroy;
  end;

  type
    TListOrderItemOption = Class( TObjectList )
      private
        function GetItems(Index: Integer): TOrderItemOption;
        procedure SetItems(Index: Integer; const Value: TOrderItemOption);
      public
        function Add(AObject: TOrderItemOption): Integer;
        property Items[Index: Integer]: TOrderItemOption read GetItems write SetItems; default;
  End;

  type
    TOrderItem = class
      id                  : PChar;
      code                : PChar;
      name                : PChar;
      quantity            : Integer;
      price               : Double;
      options             : TListOrderItemOption;
      notes               : TStringList;
      extraFields         : PChar;

      constructor Create;
      Destructor Destroy;
  end;

  type
    TListOrderItem = Class( TObjectList )
      private
        function GetItems(Index: Integer): TOrderItem;
        procedure SetItems(Index: Integer; const Value: TOrderItem);
      public
        function Add(AObject: TOrderItem): Integer;
        property Items[Index: Integer]: TOrderItem read GetItems write SetItems; default;
  End;

  type
    TOrder = class
      id                  : PChar;
      date                : PChar;
      table               : Integer;
      card                : Integer;
      items               : TListOrderItem;

      constructor Create;
      Destructor Destroy;
  end;

  type
    TListOrder = Class( TObjectList )
      private
        function GetItems(Index: Integer): TOrder;
        procedure SetItems(Index: Integer; const Value: TOrder);
      public
        function Add(AObject: TOrder): Integer;
        property Items[Index: Integer]: TOrder read GetItems write SetItems; default;
  End;

  type
    TOrderResult = class
      success             : Boolean;
      message             : PChar;
      responseCode        : Integer;
      data                : TListOrder;
      count               : Integer;

      constructor Create;
      Destructor Destroy;
  end;


  Constructor TOrderItemOption.Create;
  begin
    notes := TStringList.Create;
  end;

  Destructor TOrderItemOption.Destroy;
  begin
    FreeAndNil(notes);
  end;

  Constructor TOrderItem.Create;
  begin
    options := TListOrderItemOption.Create;
    notes := TStringList.Create;
  end;

  Destructor TOrderItem.Destroy;
  begin
    FreeAndNil(options);
    FreeAndNil(notes);
  end;

  Constructor TOrder.Create;
  begin
    items := TListOrderItem.Create;
  end;

  Destructor TOrder.Destroy;
  begin
    FreeAndNil(items);
  end;

  Constructor TOrderResult.Create;
  begin
    data := TListOrder.Create;
  end;

  Destructor TOrderResult.Destroy;
  begin
    FreeAndNil(data);
  end;

  function TListOrderItemOption.GetItems(Index: Integer): TOrderItemOption;
  begin
    Result := TOrderItemOption(inherited Items[Index]);
  end;

  procedure TListOrderItemOption.SetItems(Index: Integer;
  const Value: TOrderItemOption);
  begin
    inherited Items[Index] := Value;
  end;

  function TListOrderItemOption.Add(AObject: TOrderItemOption): Integer;
  begin
    Result := inherited Add(AObject);
  end;

  function TListOrderItem.GetItems(Index: Integer): TOrderItem;
  begin
    Result := TOrderItem(inherited Items[Index]);
  end;

  procedure TListOrderItem.SetItems(Index: Integer;
  const Value: TOrderItem);
  begin
    inherited Items[Index] := Value;
  end;

  function TListOrderItem.Add(AObject: TOrderItem): Integer;
  begin
    Result := inherited Add(AObject);
  end;

  function TListOrder.GetItems(Index: Integer): TOrder;
  begin
    Result := TOrder(inherited Items[Index]);
  end;

  procedure TListOrder.SetItems(Index: Integer;
  const Value: TOrder);
  begin
    inherited Items[Index] := Value;
  end;

  function TListOrder.Add(AObject: TOrder): Integer;
  begin
    Result := inherited Add(AObject);
  end;





  //PRODUCT
  type
    TProduct = class
      code                : PChar;
      name                : PChar;
      price               : Double;
      extraFields         : PChar;
  end;

  type
    TListProduct = Class( TObjectList )
      private
        function GetItems(Index: Integer): TProduct;
        procedure SetItems(Index: Integer; const Value: TProduct);
      public
        function Add(AObject: TProduct): Integer;
        property Items[Index: Integer]: TProduct read GetItems write SetItems; default;
  End;

  type
    TProductResult = class
      success             : Boolean;
      message             : PChar;
      responseCode        : Integer;
      data                : TListProduct;
      count               : Integer;

      constructor Create;
      Destructor Destroy;
  end;

  Constructor TProductResult.Create;
  begin
    data := TListProduct.Create;
  end;

  Destructor TProductResult.Destroy;
  begin
    FreeAndNil(data);
  end;

  function TListProduct.GetItems(Index: Integer): TProduct;
  begin
    Result := TProduct(inherited Items[Index]);
  end;

  procedure TListProduct.SetItems(Index: Integer;
  const Value: TProduct);
  begin
    inherited Items[Index] := Value;
  end;

  function TListProduct.Add(AObject: TProduct): Integer;
  begin
    Result := inherited Add(AObject);
  end;





  //TABLE
  type
    TTable = class
      code                : Integer;
      name                : PChar;
      servicePercentage   : Double;
  end;

  type
    TListTable = Class( TObjectList )
      private
        function GetItems(Index: Integer): TTable;
        procedure SetItems(Index: Integer; const Value: TTable);
      public
        function Add(AObject: TTable): Integer;
        property Items[Index: Integer]: TTable read GetItems write SetItems; default;
  End;

  type
    TTableResult = class
      success             : Boolean;
      message             : PChar;
      responseCode        : Integer;
      data                : TListTable;
      count               : Integer;

      constructor Create;
      Destructor Destroy;
  end;

  Constructor TTableResult.Create;
  begin
    data := TListTable.Create;
  end;

  Destructor TTableResult.Destroy;
  begin
    FreeAndNil(data);
  end;

  function TListTable.GetItems(Index: Integer): TTable;
  begin
    Result := TTable(inherited Items[Index]);
  end;

  procedure TListTable.SetItems(Index: Integer;
  const Value: TTable);
  begin
    inherited Items[Index] := Value;
  end;

  function TListTable.Add(AObject: TTable): Integer;
  begin
    Result := inherited Add(AObject);
  end;





  //CARD
  type
    TCard = class
      code                : Integer;
      qrCode              : PChar;
      servicePercentage   : Double;
  end;

  type
    TListCard = Class( TObjectList )
      private
        function GetItems(Index: Integer): TCard;
        procedure SetItems(Index: Integer; const Value: TCard);
      public
        function Add(AObject: TCard): Integer;
        property Items[Index: Integer]: TCard read GetItems write SetItems; default;
  End;

  type
    TCardResult = class
      success             : Boolean;
      message             : PChar;
      responseCode        : Integer;
      data                : TListCard;
      count               : Integer;

      constructor Create;
      Destructor Destroy;
  end;

  Constructor TCardResult.Create;
  begin
    data := TListCard.Create;
  end;

  Destructor TCardResult.Destroy;
  begin
    FreeAndNil(data);
  end;

  function TListCard.GetItems(Index: Integer): TCard;
  begin
    Result := TCard(inherited Items[Index]);
  end;

  procedure TListCard.SetItems(Index: Integer;
  const Value: TCard);
  begin
    inherited Items[Index] := Value;
  end;

  function TListCard.Add(AObject: TCard): Integer;
  begin
    Result := inherited Add(AObject);
  end;





   //USER
  type
    TUser = class
      code                : Integer;
      name                : PChar;
      active              : Boolean;
  end;

  type
    TListUser = Class( TObjectList )
      private
        function GetItems(Index: Integer): TUser;
        procedure SetItems(Index: Integer; const Value: TUser);
      public
        function Add(AObject: TUser): Integer;
        property Items[Index: Integer]: TUser read GetItems write SetItems; default;
  End;

  type
    TUserResult = class
      success             : Boolean;
      message             : PChar;
      responseCode        : Integer;
      data                : TListUser;
      count               : Integer;

      constructor Create;
      Destructor Destroy;
  end;

  Constructor TUserResult.Create;
  begin
    data := TListUser.Create;
  end;

  Destructor TUserResult.Destroy;
  begin
    FreeAndNil(data);
  end;

  function TListUser.GetItems(Index: Integer): TUser;
  begin
    Result := TUser(inherited Items[Index]);
  end;

  procedure TListUser.SetItems(Index: Integer;
  const Value: TUser);
  begin
    inherited Items[Index] := Value;
  end;

  function TListUser.Add(AObject: TUser): Integer;
  begin
    Result := inherited Add(AObject);
  end;





  //ITEM
  type
    TITemResult = class
      success             : Boolean;
      message             : PChar;
      responseCode        : Integer;
      data                : TOrderItem;
      count               : Integer;
  end;


  const
    apiUrl      : String = 'https://developers.oimenu.com.br';
    apiVersion  : String = 'v1';





function getJson(token: String; method: String; api: String; postJson: String):TJSONObject;
var
  url, requestResult : String;
  PostDataStream : TStringStream;
  IdHTTP: TIdHTTP;

  jsonToSend: TStringStream;
  jsonObj: TJSONObject;
begin
  requestResult := '';

  IdHTTP := TIdHTTP.Create(nil);
  IdHTTP.Request.UserAgent := 'Mozilla/5.0';
  IdHTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + token);

  IdHTTP.Request.ContentType := 'application/json';
  IdHTTP.Request.CharSet := 'utf-8';

  url := apiUrl + '/api/' + apiVersion + '/' + api;

  try
    try
      if (method = 'POST') then
      begin
        jsonToSend := TStringStream.Create(Utf8Encode(postJson));
        requestResult := UTF8Decode(IdHTTP.Post(url, jsonToSend));
      end else if (method = 'PUT') then
      begin
        if (postJson <> '') then
          jsonToSend := TStringStream.Create(Utf8Encode(postJson))
        else
          jsonToSend := nil;
        requestResult := UTF8Decode(IdHTTP.Put(url, jsonToSend));
      end else if (method = 'DELETE') then
      begin
        PostDataStream := TStringStream.Create('');
        IdHTTP.Delete(url, PostDataStream);
        requestResult := UTF8Decode(PostDataStream.DataString);
      end else if (method = 'GET') then
      begin
        PostDataStream := TStringStream.Create('');
        IdHTTP.Get(url, PostDataStream);
        requestResult := UTF8Decode(PostDataStream.DataString);
      end;
    except
      on E: EIdHTTPProtocolException do begin
        requestResult := StringReplace(E.ErrorMessage,#13#10, ' ', [rfReplaceAll, rfIgnoreCase]);
      end;
      on E: Exception do
        requestResult := '{"success":"false","message":"'+StringReplace(E.Message,#13#10, ' ', [rfReplaceAll, rfIgnoreCase])+'","code":"501"}';
    end;
  finally
    IdHTTP.Disconnect;
    jsonObj := TJSONObject.create(requestResult);
    if (jsonObj.has('success') = false) then
      jsonObj.put('success', 'false');
    if (jsonObj.has('code') = false) then
      jsonObj.put('code', 200);
    if (jsonObj.has('message') = false) then
      jsonObj.put('message', '');
    Result := jsonObj;
  end;

end;






//PRODUCT
function createProduct(token: String; product: TProduct): TProductResult;stdcall;
var
  productResult: TProductResult;
  jsonObj: TJSONObject;
  list: TListProduct;
begin
  jsonObj := TJSONObject.create;
  jsonObj.put('code', product.code);
  jsonObj.put('name', product.name);
  jsonObj.put('price', product.price);
  jsonObj.put('extra_fields', product.extraFields);

  jsonObj := getJson(token, 'POST', 'product', jsonObj.toString);

  productResult := TProductResult.Create;

  productResult.success := jsonObj.getBoolean('success');
  productResult.message := PChar(jsonObj.getString('message'));
  productResult.responseCode := jsonObj.getInt('code');

  if (productResult.success) then
  begin
    productResult.count := 1;

    product := TProduct.Create;
    product.code := PChar(jsonObj.getJSONObject('data').getString('code'));
    product.name := PChar(jsonObj.getJSONObject('data').getString('name'));
    product.price := jsonObj.getJSONObject('data').getDouble('price');
    product.extraFields := PChar(jsonObj.getJSONObject('data').getString('extra_fields'));

    list := TListProduct.Create;
    list.Add(product);

    productResult.data := list;
  end else begin
    productResult.count := 0;
  end;

  Result := productResult;
end;

function batchProducts(token: String; products: TListProduct): TSimpleResult;stdcall;
var
  simpleResult: TSimpleResult;
  jsonObj: TJSONObject;
  jsonArray: TJSONArray;
  count: Integer;
begin

  jsonArray := TJSONArray.create;
  for count := 0 to products.Count-1 do
  begin
    jsonObj := TJSONObject.create;
    jsonObj.put('code', products.Items[count].code);
    jsonObj.put('name', products.Items[count].name);
    jsonObj.put('price', products.Items[count].price);
    jsonObj.put('extra_fields', products.Items[count].extraFields);
    jsonArray.put(jsonObj);
  end;

  jsonObj := getJson(token, 'POST', 'products', jsonArray.toString);

  simpleResult := TSimpleResult.Create;

  simpleResult.success := jsonObj.getBoolean('success');
  simpleResult.message := PChar(jsonObj.getString('message'));
  simpleResult.responseCode := jsonObj.getInt('code');
  simpleResult.count := 0;

  Result := simpleResult;
end;

function updateProduct(token: String; product: TProduct): TProductResult;stdcall;
var
  productResult: TProductResult;
  jsonObj: TJSONObject;
  list: TListProduct;
begin
  jsonObj := TJSONObject.create;
  jsonObj.put('code', product.code);
  jsonObj.put('name', product.name);
  jsonObj.put('price', product.price);
  jsonObj.put('extra_fields', product.extraFields);

  jsonObj := getJson(token, 'PUT', 'product/' + product.code, jsonObj.toString);

  productResult := TProductResult.Create;

  productResult.success := jsonObj.getBoolean('success');
  productResult.message := PChar(jsonObj.getString('message'));
  productResult.responseCode := jsonObj.getInt('code');

  if (productResult.success) then
  begin
    productResult.count := 1;

    product := TProduct.Create;
    product.code := PChar(jsonObj.getJSONObject('data').getString('code'));
    product.name := PChar(jsonObj.getJSONObject('data').getString('name'));
    product.price := jsonObj.getJSONObject('data').getDouble('price');
    product.extraFields := PChar(jsonObj.getJSONObject('data').getString('extra_fields'));

    list := TListProduct.Create;
    list.Add(product);

    productResult.data := list;
  end else begin
    productResult.count := 0;
  end;

  Result := productResult;
end;

function deleteProduct(token: String; id: PChar): TSimpleResult;stdcall;
var
  simpleResult: TSimpleResult;
  jsonObj: TJSONObject;
begin
  jsonObj := getJson(token, 'DELETE', 'product/' + id, '');

  simpleResult := TSimpleResult.Create;

  simpleResult.success := jsonObj.getBoolean('success');
  simpleResult.message := PChar(jsonObj.getString('message'));
  simpleResult.responseCode := jsonObj.getInt('code');
  simpleResult.count := 0;

  Result := simpleResult;
end;




//ORDER
function getAllOrders(token: String): TOrderResult;stdcall;
var
  orderResult: TOrderResult;
  jsonObj: TJSONObject;
  x, y, z, w: Integer;
  order: TOrder;
  orderItem: TOrderItem;
  orderItemOption: TOrderItemOption;
begin

  jsonObj := getJson(token, 'GET', 'orders', '');

  orderResult := TOrderResult.Create;

  orderResult.success := jsonObj.getBoolean('success');
  orderResult.message := PChar(jsonObj.getString('message'));
  orderResult.responseCode := jsonObj.getInt('code');

  if (orderResult.success) then
  begin
    orderResult.count := jsonObj.getJSONArray('data').length;

    for x := 0 to jsonObj.getJSONArray('data').length-1 do
    begin
      order := TOrder.Create;
      order.id := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getString('id'));
      order.date := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getString('date'));
      order.table := jsonObj.getJSONArray('data').getJSONObject(x).getInt('table');
      order.card := jsonObj.getJSONArray('data').getJSONObject(x).getInt('card');
      for y := 0 to jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').length-1 do
      begin
        orderItem := TOrderItem.Create;
        orderItem.id := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getString('id'));
        orderItem.code := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getString('code'));
        orderItem.name := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getString('name'));
        orderItem.quantity := jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getInt('quantity');
        orderItem.price := jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getDouble('price');

        for z := 0 to jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getJSONArray('notes').length-1 do
          orderItem.notes.Add(jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getJSONArray('notes').getString(z));

        orderItem.extraFields := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getString('extra_fields'));

        for z := 0 to jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getJSONArray('options').length-1 do
        begin
           orderItemOption := TOrderItemOption.Create;
           orderItemOption.id := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getJSONArray('options').getJSONObject(z).getString('id'));
           orderItemOption.optionId := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getJSONArray('options').getJSONObject(z).getString('option_id'));
           orderItemOption.code := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getJSONArray('options').getJSONObject(z).getString('code'));
           orderItemOption.name := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getJSONArray('options').getJSONObject(z).getString('name'));
           orderItemOption.quantity := jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getJSONArray('options').getJSONObject(z).getInt('quantity');
           orderItemOption.price := jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getJSONArray('options').getJSONObject(z).getDouble('price');

           for w := 0 to jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getJSONArray('options').getJSONObject(z).getJSONArray('notes').length-1 do
              orderItem.notes.Add(jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getJSONArray('options').getJSONObject(z).getJSONArray('notes').getString(w));

           orderItemOption.extraFields := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getJSONArray('items').getJSONObject(y).getJSONArray('options').getJSONObject(z).getString('extra_fields'));
           orderItem.options.Add(orderItemOption);
        end;
        order.items.Add(orderItem);
      end;
      orderResult.data.Add(order);
    end;
  end else begin
    orderResult.count := 0;
  end;

  Result := orderResult;
end;

function setOrderAsReceived(token: String; id: String): TSimpleResult;stdcall;
var
  simpleResult: TSimpleResult;
  jsonObj: TJSONObject;
begin
  jsonObj := getJson(token, 'PUT', 'order/' + id + '/received', '');

  simpleResult := TSimpleResult.Create;

  simpleResult.success := jsonObj.getBoolean('success');
  simpleResult.message := PChar(jsonObj.getString('message'));
  simpleResult.responseCode := jsonObj.getInt('code');
  simpleResult.count := 0;

  Result := simpleResult;
end;




//TABLE ACTION
function closeTable(token: String; code: Integer ): TSimpleResult;stdcall;
var
  simpleResult: TSimpleResult;
  jsonObj: TJSONObject;
begin
  jsonObj := getJson(token, 'PUT', 'table/' + IntToStr(code) + '/close', '');

  simpleResult := TSimpleResult.Create;

  simpleResult.success := jsonObj.getBoolean('success');
  simpleResult.message := PChar(jsonObj.getString('message'));
  simpleResult.responseCode := jsonObj.getInt('code');
  simpleResult.count := 0;

  Result := simpleResult;
end;

function cancelTable(token: String; code: Integer ): TSimpleResult;stdcall;
var
  simpleResult: TSimpleResult;
  jsonObj: TJSONObject;
begin
  jsonObj := getJson(token, 'PUT', 'table/' + IntToStr(code) + '/cancel', '');

  simpleResult := TSimpleResult.Create;

  simpleResult.success := jsonObj.getBoolean('success');
  simpleResult.message := PChar(jsonObj.getString('message'));
  simpleResult.responseCode := jsonObj.getInt('code');
  simpleResult.count := 0;

  Result := simpleResult;
end;

function cancelTableItem(token: String; code: Integer; idItem: String ): TItemResult; stdcall;
var
  itemResult: TItemResult;
  jsonObj: TJSONObject;
  orderItem: TOrderItem;
  orderItemOption: TOrderItemOption;
  x, y: Integer;
begin
  jsonObj := getJson(token, 'PUT', 'table/' + IntToStr(code) + '/item/' + idItem + '/cancel', '');

  itemResult := TItemResult.Create;

  itemResult.success := jsonObj.getBoolean('success');
  itemResult.message := PChar(jsonObj.getString('message'));
  itemResult.responseCode := jsonObj.getInt('code');

  if (itemResult.success) then
  begin
    itemResult.count := 1;
    orderItem := TOrderItem.Create;
    orderItem.id := PChar(jsonObj.getJSONObject('data').getString('id'));
    orderItem.code := PChar(jsonObj.getJSONObject('data').getString('code'));
    orderItem.name := PChar(jsonObj.getJSONObject('data').getString('name'));
    orderItem.quantity := jsonObj.getJSONObject('data').getInt('quantity');
    orderItem.price := jsonObj.getJSONObject('data').getDouble('price');

    for x := 0 to jsonObj.getJSONObject('data').getJSONArray('notes').length-1 do
      orderItem.notes.Add(jsonObj.getJSONObject('data').getJSONArray('notes').getString(x));

    orderItem.extraFields := PChar(jsonObj.getJSONObject('data').getString('extra_fields'));

    for x := 0 to jsonObj.getJSONObject('data').getJSONArray('options').length-1 do
    begin
      orderItemOption := TOrderItemOption.Create;
      orderItemOption.id := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('id'));
      orderItemOption.optionId := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('option_id'));
      orderItemOption.code := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('code'));
      orderItemOption.name := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('name'));
      orderItemOption.quantity := jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getInt('quantity');
      orderItemOption.price := jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getDouble('price');

      for y := 0 to jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getJSONArray('notes').length-1 do
        orderItem.notes.Add(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getJSONArray('notes').getString(y));

      orderItemOption.extraFields := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('extra_fields'));
      orderItem.options.Add(orderItemOption);
    end;
  end else begin
    itemResult.count := 0;
  end;

  Result := itemResult;
end;


function cancelTableItemQtd(token: String; code: Integer; idItem: String; quantity: Integer ): TItemResult; stdcall;
var
  itemResult: TItemResult;
  jsonObj: TJSONObject;
  orderItem: TOrderItem;
  orderItemOption: TOrderItemOption;
  x, y: Integer;
begin
  jsonObj := getJson(token, 'PUT', 'table/' + IntToStr(code) + '/item/' + idItem + '/cancel', '{"quantity":'+IntToStr(quantity)+'}');

  itemResult := TItemResult.Create;

  itemResult.success := jsonObj.getBoolean('success');
  itemResult.message := PChar(jsonObj.getString('message'));
  itemResult.responseCode := jsonObj.getInt('code');

  if (itemResult.success) then
  begin
    itemResult.count := 1;
    orderItem := TOrderItem.Create;
    orderItem.id := PChar(jsonObj.getJSONObject('data').getString('id'));
    orderItem.code := PChar(jsonObj.getJSONObject('data').getString('code'));
    orderItem.name := PChar(jsonObj.getJSONObject('data').getString('name'));
    orderItem.quantity := jsonObj.getJSONObject('data').getInt('quantity');
    orderItem.price := jsonObj.getJSONObject('data').getDouble('price');

    for x := 0 to jsonObj.getJSONObject('data').getJSONArray('notes').length-1 do
      orderItem.notes.Add(jsonObj.getJSONObject('data').getJSONArray('notes').getString(x));

    orderItem.extraFields := PChar(jsonObj.getJSONObject('data').getString('extra_fields'));

    for x := 0 to jsonObj.getJSONObject('data').getJSONArray('options').length-1 do
    begin
      orderItemOption := TOrderItemOption.Create;
      orderItemOption.id := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('id'));
      orderItemOption.optionId := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('option_id'));
      orderItemOption.code := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('code'));
      orderItemOption.name := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('name'));
      orderItemOption.quantity := jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getInt('quantity');
      orderItemOption.price := jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getDouble('price');

      for y := 0 to jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getJSONArray('notes').length-1 do
        orderItem.notes.Add(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getJSONArray('notes').getString(y));

      orderItemOption.extraFields := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('extra_fields'));
      orderItem.options.Add(orderItemOption);
    end;
  end else begin
    itemResult.count := 0;
  end;

  Result := itemResult;
end;




//CARD ACTION
function closeCard(token: String; code: Integer ): TSimpleResult;stdcall;
var
  simpleResult: TSimpleResult;
  jsonObj: TJSONObject;
begin
  jsonObj := getJson(token, 'PUT', 'card/' + IntToStr(code) + '/close', '');

  simpleResult := TSimpleResult.Create;

  simpleResult.success := jsonObj.getBoolean('success');
  simpleResult.message := PChar(jsonObj.getString('message'));
  simpleResult.responseCode := jsonObj.getInt('code');
  simpleResult.count := 0;

  Result := simpleResult;
end;

function cancelCard(token: String; code: Integer ): TSimpleResult;stdcall;
var
  simpleResult: TSimpleResult;
  jsonObj: TJSONObject;
begin
  jsonObj := getJson(token, 'PUT', 'card/' + IntToStr(code) + '/cancel', '');

  simpleResult := TSimpleResult.Create;

  simpleResult.success := jsonObj.getBoolean('success');
  simpleResult.message := PChar(jsonObj.getString('message'));
  simpleResult.responseCode := jsonObj.getInt('code');
  simpleResult.count := 0;

  Result := simpleResult;
end;

function cancelCardItem(token: String; code: Integer; idItem: String ): TItemResult; stdcall;
var
  itemResult: TItemResult;
  jsonObj: TJSONObject;
  orderItem: TOrderItem;
  orderItemOption: TOrderItemOption;
  x, y: Integer;
begin
  jsonObj := getJson(token, 'PUT', 'card/' + IntToStr(code) + '/item/' + idItem + '/cancel', '');

  itemResult := TItemResult.Create;

  itemResult.success := jsonObj.getBoolean('success');
  itemResult.message := PChar(jsonObj.getString('message'));
  itemResult.responseCode := jsonObj.getInt('code');

  if (itemResult.success) then
  begin
    itemResult.count := 1;
    orderItem := TOrderItem.Create;
    orderItem.id := PChar(jsonObj.getJSONObject('data').getString('id'));
    orderItem.code := PChar(jsonObj.getJSONObject('data').getString('code'));
    orderItem.name := PChar(jsonObj.getJSONObject('data').getString('name'));
    orderItem.quantity := jsonObj.getJSONObject('data').getInt('quantity');
    orderItem.price := jsonObj.getJSONObject('data').getDouble('price');

    for x := 0 to jsonObj.getJSONObject('data').getJSONArray('notes').length-1 do
      orderItem.notes.Add(jsonObj.getJSONObject('data').getJSONArray('notes').getString(x));
      
    orderItem.extraFields := PChar(jsonObj.getJSONObject('data').getString('extra_fields'));

    for x := 0 to jsonObj.getJSONObject('data').getJSONArray('options').length-1 do
    begin
      orderItemOption := TOrderItemOption.Create;
      orderItemOption.id := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('id'));
      orderItemOption.optionId := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('option_id'));
      orderItemOption.code := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('code'));
      orderItemOption.name := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('name'));
      orderItemOption.quantity := jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getInt('quantity');
      orderItemOption.price := jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getDouble('price');

      for y := 0 to jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getJSONArray('notes').length-1 do
        orderItem.notes.Add(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getJSONArray('notes').getString(y));

      orderItemOption.extraFields := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('extra_fields'));
      orderItem.options.Add(orderItemOption);
    end;
  end else begin
    itemResult.count := 0;
  end;

  Result := itemResult;
end;


function cancelCardItemQtd(token: String; code: Integer; idItem: String; quantity: Integer ): TItemResult; stdcall;
var
  itemResult: TItemResult;
  jsonObj: TJSONObject;
  orderItem: TOrderItem;
  orderItemOption: TOrderItemOption;
  x, y: Integer;
begin
  jsonObj := getJson(token, 'PUT', 'card/' + IntToStr(code) + '/item/' + idItem + '/cancel', '{"quantity":'+IntToStr(quantity)+'}');

  itemResult := TItemResult.Create;

  itemResult.success := jsonObj.getBoolean('success');
  itemResult.message := PChar(jsonObj.getString('message'));
  itemResult.responseCode := jsonObj.getInt('code');

  if (itemResult.success) then
  begin
    itemResult.count := 1;
    orderItem := TOrderItem.Create;
    orderItem.id := PChar(jsonObj.getJSONObject('data').getString('id'));
    orderItem.code := PChar(jsonObj.getJSONObject('data').getString('code'));
    orderItem.name := PChar(jsonObj.getJSONObject('data').getString('name'));
    orderItem.quantity := jsonObj.getJSONObject('data').getInt('quantity');
    orderItem.price := jsonObj.getJSONObject('data').getDouble('price');

    for x := 0 to jsonObj.getJSONObject('data').getJSONArray('notes').length-1 do
      orderItem.notes.Add(jsonObj.getJSONObject('data').getJSONArray('notes').getString(x));

    orderItem.extraFields := PChar(jsonObj.getJSONObject('data').getString('extra_fields'));

    for x := 0 to jsonObj.getJSONObject('data').getJSONArray('options').length-1 do
    begin
      orderItemOption := TOrderItemOption.Create;
      orderItemOption.id := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('id'));
      orderItemOption.optionId := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('option_id'));
      orderItemOption.code := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('code'));
      orderItemOption.name := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('name'));
      orderItemOption.quantity := jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getInt('quantity');
      orderItemOption.price := jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getDouble('price');

      for y := 0 to jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getJSONArray('notes').length-1 do
        orderItem.notes.Add(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getJSONArray('notes').getString(y));

      orderItemOption.extraFields := PChar(jsonObj.getJSONObject('data').getJSONArray('options').getJSONObject(x).getString('extra_fields'));
      orderItem.options.Add(orderItemOption);
    end;
  end else begin
    itemResult.count := 0;
  end;

  Result := itemResult;
end;






//TABLE
function getAllTables(token: String): TTableResult;stdcall;
var
  tableResult: TTableResult;
  jsonObj: TJSONObject;
  table: TTable;
  x: Integer;
begin
  jsonObj := getJson(token, 'GET', 'tables', '');

  tableResult := TTableResult.Create;

  tableResult.success := jsonObj.getBoolean('success');
  tableResult.message := PChar(jsonObj.getString('message'));
  tableResult.responseCode := jsonObj.getInt('code');

  if (tableResult.success) then
  begin
    tableResult.count := jsonObj.getJSONArray('data').length;
    for x := 0 to jsonObj.getJSONArray('data').length-1 do
    begin
      table := TTable.Create;
      table.code := jsonObj.getJSONArray('data').getJSONObject(x).getInt('code');
      table.name := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getString('name'));
      table.servicePercentage := jsonObj.getJSONArray('data').getJSONObject(x).getDouble('service_percentage');
      tableResult.data.Add(table);
    end;
  end else begin
    tableResult.count := 0;
  end;

  Result := tableResult;
end;

function createTable(token: String; table: TTable): TTableResult;stdcall;
var
  tableResult: TTableResult;
  jsonObj: TJSONObject;
  list: TListTable;
begin
  jsonObj := TJSONObject.create;
  jsonObj.put('code', table.code);
  jsonObj.put('name', table.name);
  jsonObj.put('service_percentage', table.servicePercentage);

  jsonObj := getJson(token, 'POST', 'table', jsonObj.toString);

  tableResult := TTableResult.Create;

  tableResult.success := jsonObj.getBoolean('success');
  tableResult.message := PChar(jsonObj.getString('message'));
  tableResult.responseCode := jsonObj.getInt('code');

  if (tableResult.success) then
  begin
    tableResult.count := 1;

    table := TTable.Create;
    table.code := jsonObj.getJSONObject('data').getInt('code');
    table.name := PChar(jsonObj.getJSONObject('data').getString('name'));
    table.servicePercentage := jsonObj.getJSONObject('data').getDouble('service_percentage');

    list := TListTable.Create;
    list.Add(table);

    tableResult.data := list;
  end else begin
    tableResult.count := 0;
  end;

  Result := tableResult;
end;

function batchTables(token: String; tables: TListTable): TSimpleResult;stdcall;
var
  simpleResult: TSimpleResult;
  jsonObj: TJSONObject;
  jsonArray: TJSONArray;
  count: Integer;
begin

  jsonArray := TJSONArray.create;
  for count := 0 to tables.Count-1 do
  begin
    jsonObj := TJSONObject.create;
    jsonObj.put('code', tables.Items[count].code);
    jsonObj.put('name', tables.Items[count].name);
    jsonObj.put('service_percentage', tables.Items[count].servicePercentage);
    jsonArray.put(jsonObj);
  end;

  jsonObj := getJson(token, 'POST', 'tables', jsonArray.toString);

  simpleResult := TSimpleResult.Create;

  simpleResult.success := jsonObj.getBoolean('success');
  simpleResult.message := PChar(jsonObj.getString('message'));
  simpleResult.responseCode := jsonObj.getInt('code');
  simpleResult.count := 0;

  Result := simpleResult;
end;

function updateTable(token: String; table: TTable): TTableResult;stdcall;
var
  tableResult: TTableResult;
  jsonObj: TJSONObject;
  list: TListTable;
begin
  jsonObj := TJSONObject.create;
  jsonObj.put('code', table.code);
  jsonObj.put('name', table.name);
  jsonObj.put('service_percentage', table.servicePercentage);

  jsonObj := getJson(token, 'PUT', 'table/' + IntToStr(table.code), jsonObj.toString);

  tableResult := TTableResult.Create;

  tableResult.success := jsonObj.getBoolean('success');
  tableResult.message := PChar(jsonObj.getString('message'));
  tableResult.responseCode := jsonObj.getInt('code');

  if (tableResult.success) then
  begin
    tableResult.count := 1;

    table := TTable.Create;
    table.code := jsonObj.getJSONObject('data').getInt('code');
    table.name := PChar(jsonObj.getJSONObject('data').getString('name'));
    table.servicePercentage := jsonObj.getJSONObject('data').getDouble('service_percentage');


    list := TListTable.Create;
    list.Add(table);

    tableResult.data := list;
  end else begin
    tableResult.count := 0;
  end;

  Result := tableResult;
end;

function deleteTable(token: String; id: Integer): TSimpleResult;stdcall;
var
  simpleResult: TSimpleResult;
  jsonObj: TJSONObject;
begin
  jsonObj := getJson(token, 'DELETE', 'table/' + IntToStr(id), '');

  simpleResult := TSimpleResult.Create;

  simpleResult.success := jsonObj.getBoolean('success');
  simpleResult.message := PChar(jsonObj.getString('message'));
  simpleResult.responseCode := jsonObj.getInt('code');
  simpleResult.count := 0;

  Result := simpleResult;
end;





//CARD
function getAllCards(token: String): TCardResult;stdcall;
var
  cardResult: TCardResult;
  jsonObj: TJSONObject;
  card: TCard;
  x: Integer;
begin
  jsonObj := getJson(token, 'GET', 'cards', '');

  cardResult := TCardResult.Create;

  cardResult.success := jsonObj.getBoolean('success');
  cardResult.message := PChar(jsonObj.getString('message'));
  cardResult.responseCode := jsonObj.getInt('code');

  if (cardResult.success) then
  begin
    cardResult.count := jsonObj.getJSONArray('data').length;
    for x := 0 to jsonObj.getJSONArray('data').length-1 do
    begin
      card := TCard.Create;
      card.code := jsonObj.getJSONArray('data').getJSONObject(x).getInt('code');
      card.qrCode := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getString('qr_code'));
      card.servicePercentage := jsonObj.getJSONArray('data').getJSONObject(x).getDouble('service_percentage');
      cardResult.data.Add(card);
    end;
  end else begin
    cardResult.count := 0;
  end;

  Result := cardResult;
end;

function createCard(token: String; card: TCard): TCardResult;stdcall;
var
  cardResult: TCardResult;
  jsonObj: TJSONObject;
  list: TListCard;
begin
  jsonObj := TJSONObject.create;
  jsonObj.put('code', card.code);
  jsonObj.put('qr_code', card.qrCode);
  jsonObj.put('service_percentage', card.servicePercentage);

  jsonObj := getJson(token, 'POST', 'card', jsonObj.toString);

  cardResult := TCardResult.Create;

  cardResult.success := jsonObj.getBoolean('success');
  cardResult.message := PChar(jsonObj.getString('message'));
  cardResult.responseCode := jsonObj.getInt('code');

  if (cardResult.success) then
  begin
    cardResult.count := 1;

    card := TCard.Create;
    card.code := jsonObj.getJSONObject('data').getInt('code');
    card.qrCode := PChar(jsonObj.getJSONObject('data').getString('qr_code'));
    card.servicePercentage := jsonObj.getJSONObject('data').getDouble('service_percentage');

    list := TListCard.Create;
    list.Add(card);

    cardResult.data := list;
  end else begin
    cardResult.count := 0;
  end;

  Result := cardResult;
end;

function batchCards(token: String; cards: TListCard): TSimpleResult;stdcall;
var
  simpleResult: TSimpleResult;
  jsonObj: TJSONObject;
  jsonArray: TJSONArray;
  count: Integer;
begin

  jsonArray := TJSONArray.create;
  for count := 0 to cards.Count-1 do
  begin
    jsonObj := TJSONObject.create;
    jsonObj.put('code', cards.Items[count].code);
    jsonObj.put('qr_code', cards.Items[count].qrCode);
    jsonObj.put('service_percentage', cards.Items[count].servicePercentage);
    jsonArray.put(jsonObj);
  end;

  jsonObj := getJson(token, 'POST', 'cards', jsonArray.toString);

  simpleResult := TSimpleResult.Create;

  simpleResult.success := jsonObj.getBoolean('success');
  simpleResult.message := PChar(jsonObj.getString('message'));
  simpleResult.responseCode := jsonObj.getInt('code');
  simpleResult.count := 0;

  Result := simpleResult;
end;

function updateCard(token: String; card: TCard): TCardResult;stdcall;
var
  cardResult: TCardResult;
  jsonObj: TJSONObject;
  list: TListCard;
begin
  jsonObj := TJSONObject.create;
  jsonObj.put('code', card.code);
  jsonObj.put('qr_code', card.qrCode);
  jsonObj.put('service_percentage', card.servicePercentage);

  jsonObj := getJson(token, 'PUT', 'card/' + IntToStr(card.code), jsonObj.toString);

  cardResult := TCardResult.Create;

  cardResult.success := jsonObj.getBoolean('success');
  cardResult.message := PChar(jsonObj.getString('message'));
  cardResult.responseCode := jsonObj.getInt('code');

  if (cardResult.success) then
  begin
    cardResult.count := 1;

    card := TCard.Create;
    card.code := jsonObj.getJSONObject('data').getInt('code');
    card.qrCode := PChar(jsonObj.getJSONObject('data').getString('qr_code'));
    card.servicePercentage := jsonObj.getJSONObject('data').getDouble('service_percentage');

    list := TListCard.Create;
    list.Add(card);

    cardResult.data := list;
  end else begin
    cardResult.count := 0;
  end;

  Result := cardResult;
end;

function deleteCard(token: String; id: Integer): TSimpleResult;stdcall;
var
  simpleResult: TSimpleResult;
  jsonObj: TJSONObject;
begin
  jsonObj := getJson(token, 'DELETE', 'card/' + IntToStr(id), '');

  simpleResult := TSimpleResult.Create;

  simpleResult.success := jsonObj.getBoolean('success');
  simpleResult.message := PChar(jsonObj.getString('message'));
  simpleResult.responseCode := jsonObj.getInt('code');
  simpleResult.count := 0;

  Result := simpleResult;
end;





//USER
function getAllUsers(token: String): TUserResult;stdcall;
var
  userResult: TUserResult;
  jsonObj: TJSONObject;
  user: TUser;
  x: Integer;
begin
  jsonObj := getJson(token, 'GET', 'users', '');

  userResult := TUserResult.Create;

  userResult.success := jsonObj.getBoolean('success');
  userResult.message := PChar(jsonObj.getString('message'));
  userResult.responseCode := jsonObj.getInt('code');

  if (userResult.success) then
  begin
    userResult.count := jsonObj.getJSONArray('data').length;
    for x := 0 to jsonObj.getJSONArray('data').length-1 do
    begin
      user := TUser.Create;
      user.code := jsonObj.getJSONArray('data').getJSONObject(x).getInt('code');
      user.name := PChar(jsonObj.getJSONArray('data').getJSONObject(x).getString('name'));
      user.active := (jsonObj.getJSONArray('data').getJSONObject(x).getInt('active') = 1);
      userResult.data.Add(user);
    end;
  end else begin
    userResult.count := 0;
  end;

  Result := userResult;
end;

function createUser(token: String; user: TUser): TUserResult;stdcall;
var
  userResult: TUserResult;
  jsonObj: TJSONObject;
  list: TListUser;
begin
  jsonObj := TJSONObject.create;
  jsonObj.put('code', user.code);
  jsonObj.put('name', user.name);
  if (user.active) then
    jsonObj.put('active', 1)
  else
    jsonObj.put('active', 0);

  jsonObj := getJson(token, 'POST', 'user', jsonObj.toString);

  userResult := TUserResult.Create;

  userResult.success := jsonObj.getBoolean('success');
  userResult.message := PChar(jsonObj.getString('message'));
  userResult.responseCode := jsonObj.getInt('code');

  if (userResult.success) then
  begin
    userResult.count := 1;

    user := TUser.Create;
    user.code := jsonObj.getJSONObject('data').getInt('code');
    user.name := PChar(jsonObj.getJSONObject('data').getString('name'));
    user.active := (jsonObj.getJSONObject('data').getInt('active') = 1);

    list := TListUser.Create;
    list.Add(user);

    userResult.data := list;
  end else begin
    userResult.count := 0;
  end;

  Result := userResult;
end;

function batchUsers(token: String; users: TListUser): TSimpleResult;stdcall;
var
  simpleResult: TSimpleResult;
  jsonObj: TJSONObject;
  jsonArray: TJSONArray;
  count: Integer;
begin

  jsonArray := TJSONArray.create;
  for count := 0 to users.Count-1 do
  begin
    jsonObj := TJSONObject.create;
    jsonObj.put('code', users.Items[count].code);
    jsonObj.put('name', users.Items[count].name);
    if (users.Items[count].active) then
      jsonObj.put('active', 1)
    else
      jsonObj.put('active', 0);
    jsonArray.put(jsonObj);
  end;

  jsonObj := getJson(token, 'POST', 'users', jsonArray.toString);

  simpleResult := TSimpleResult.Create;

  simpleResult.success := jsonObj.getBoolean('success');
  simpleResult.message := PChar(jsonObj.getString('message'));
  simpleResult.responseCode := jsonObj.getInt('code');
  simpleResult.count := 0;

  Result := simpleResult;
end;

function updateUser(token: String; user: TUser): TUserResult;stdcall;
var
  userResult: TUserResult;
  jsonObj: TJSONObject;
  list: TListUser;
begin
  jsonObj := TJSONObject.create;
  jsonObj.put('code', user.code);
  jsonObj.put('name', user.name);
  if (user.active) then
    jsonObj.put('active', 1)
  else
    jsonObj.put('active', 1);

  jsonObj := getJson(token, 'PUT', 'user/' + IntToStr(user.code), jsonObj.toString);

  userResult := TUserResult.Create;

  userResult.success := jsonObj.getBoolean('success');
  userResult.message := PChar(jsonObj.getString('message'));
  userResult.responseCode := jsonObj.getInt('code');

  if (userResult.success) then
  begin
    userResult.count := 1;

    user := TUser.Create;
    user.code := jsonObj.getJSONObject('data').getInt('code');
    user.name := PChar(jsonObj.getJSONObject('data').getString('name'));
    user.active := (jsonObj.getJSONObject('data').getInt('active') = 1);

    list := TListUser.Create;
    list.Add(user);

    userResult.data := list;
  end else begin
    userResult.count := 0;
  end;

  Result := userResult;
end;

function deleteUser(token: String; id: Integer): TSimpleResult;stdcall;
var
  simpleResult: TSimpleResult;
  jsonObj: TJSONObject;
begin
  jsonObj := getJson(token, 'DELETE', 'user/' + IntToStr(id), '');

  simpleResult := TSimpleResult.Create;

  simpleResult.success := jsonObj.getBoolean('success');
  simpleResult.message := PChar(jsonObj.getString('message'));
  simpleResult.responseCode := jsonObj.getInt('code');
  simpleResult.count := 0;

  Result := simpleResult;
end;







exports

  createProduct,
  batchProducts,
  updateProduct,
  deleteProduct,
  getAllOrders,
  setOrderAsReceived,
  closeTable,
  cancelTable,
  cancelTableItem,
  cancelTableItemQtd,
  closeCard,
  cancelCard,
  cancelCardItem,
  cancelCardItemQtd,
  getAllTables,
  createTable,
  batchTables,
  updateTable,
  deleteTable,
  getAllCards,
  createCard,
  batchCards,
  updateCard,
  deleteCard,
  getAllUsers,
  createUser,
  batchUsers,
  updateUser,
  deleteUser;

begin
end.
