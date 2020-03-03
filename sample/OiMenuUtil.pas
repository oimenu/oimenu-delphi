unit OiMenuUtil;

interface      

uses
  SysUtils,
  Classes,
  Contnrs;

  //PARAM
  type
    TRequestParam = class
      token               : PChar;
      customUrl           : PChar;
  end;

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
    TOrderProduct = class
      code                : PChar;
      name                : PChar;
      quantity            : Integer;
      price               : Double;
  end;

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
      waiter              : PChar;
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


  //BILL

  type
    TBillItem = class
      total               : Double;
      items               : TListOrderItem;

      constructor Create;
      Destructor Destroy;
  end;

  type
    TBillResult = class
      success             : Boolean;
      message             : PChar;
      responseCode        : Integer;
      data                : TBillItem;
      count               : Integer;

      constructor Create;
      Destructor Destroy;
  end;

  //EVENT

  type
    TEventTheCheck = class
      table               : PChar;
      card                : PChar;
      waiter              : PChar;
      document              : PChar;
      splitWith           : PChar;
  end;

  type
    TEventCallWaiter = class
      table               : PChar;
      waiter              : PChar;
      options               : TStringList;

      constructor Create;
      Destructor Destroy;
  end;

  type
    TEvent = class
      id                  : PChar;
      date                : PChar;
      eventType           : PChar;
      data                : TObject;
  end;

  type
    TListEvent = Class( TObjectList )
      private
        function GetItems(Index: Integer): TEvent;
        procedure SetItems(Index: Integer; const Value: TEvent);
      public
        function Add(AObject: TEvent): Integer;
        property Items[Index: Integer]: TEvent read GetItems write SetItems; default;
  End;

  type
    TEventResult = class
      success             : Boolean;
      message             : PChar;
      responseCode        : Integer;
      data                : TListEvent;
      count               : Integer;

      constructor Create;
      Destructor Destroy;
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



  //ITEM
  type
    TITemResult = class
      success             : Boolean;
      message             : PChar;
      responseCode        : Integer;
      data                : TOrderItem;
      count               : Integer;
  end;



  function createProduct(param: TRequestParam; product: TProduct): TProductResult; stdcall; external 'oimenuapi.dll';
  function batchProducts(param: TRequestParam; products: TListProduct): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function updateProduct(param: TRequestParam; product: TProduct): TProductResult; stdcall; external 'oimenuapi.dll';
  function deleteProduct(param: TRequestParam; id: PChar): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function getAllOrders(param: TRequestParam): TOrderResult; stdcall; external 'oimenuapi.dll';
  function setOrderAsReceived(param: TRequestParam; id: String): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function getAllEvents(param: TRequestParam): TEventResult; stdcall; external 'oimenuapi.dll';
  function setEventAsReceived(param: TRequestParam; id: String): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function closeTable(param: TRequestParam; code: Integer ): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function transferTable(param: TRequestParam; code: Integer; codeNew: Integer ):  TSimpleResult;stdcall; external 'oimenuapi.dll';
  function cancelTable(param: TRequestParam; code: Integer ): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function reopenTable(param: TRequestParam; code: Integer ): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function createTableItem(param: TRequestParam; codeTable: Integer; product: TOrderProduct): TItemResult;stdcall; external 'oimenuapi.dll';
  function updateTableItem(param: TRequestParam; codeTable: Integer; idItem: String; quantity: Integer; price: Double ): TItemResult;stdcall external 'oimenuapi.dll';
  function transferTableItem(param: TRequestParam; codeTable: Integer; codeTableNew: Integer; idItem: String): TItemResult;stdcall; external 'oimenuapi.dll';
  function transferTableItemQtd(param: TRequestParam; codeTable: Integer; codeTableNew: Integer; idItem: String; quantity: Integer): TItemResult;stdcall; external 'oimenuapi.dll';
  function cancelTableItem(param: TRequestParam; code: Integer; idItem: String ): TItemResult;  stdcall; external 'oimenuapi.dll';
  function cancelTableItemQtd(param: TRequestParam; code: Integer; idItem: String; quantity: Integer ): TItemResult;  stdcall; external 'oimenuapi.dll';
  function getTableBill(param: TRequestParam; code: Integer): TBillResult;  stdcall; external 'oimenuapi.dll';
  function closeCard(param: TRequestParam; code: Integer ): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function transferCard(param: TRequestParam; code: Integer; codeNew: Integer ): TSimpleResult;stdcall; external 'oimenuapi.dll';
  function cancelCard(param: TRequestParam; code: Integer ): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function reopenCard(param: TRequestParam; code: Integer ): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function createCardItem(param: TRequestParam; codeCard: Integer; product: TOrderProduct): TItemResult;stdcall; external 'oimenuapi.dll';
  function updateCardItem(param: TRequestParam; codeCard: Integer; idItem: String; quantity: Integer; price: Double ): TItemResult;stdcall; external 'oimenuapi.dll';
  function transferCardItem(param: TRequestParam; codeCard: Integer; codeCardNew: Integer; idItem: String): TItemResult;stdcall; external 'oimenuapi.dll';
  function transferCardItemQtd(param: TRequestParam; codeCard: Integer; codeCardNew: Integer; idItem: String; quantity: Integer): TItemResult;stdcall; external 'oimenuapi.dll';
  function cancelCardItem(param: TRequestParam; code: Integer; idItem: String ): TItemResult;  stdcall; external 'oimenuapi.dll';
  function cancelCardItemQtd(param: TRequestParam; code: Integer; idItem: String; quantity: Integer ): TItemResult;  stdcall; external 'oimenuapi.dll';
  function getCardBill(param: TRequestParam; code: Integer): TBillResult;  stdcall; external 'oimenuapi.dll';
  function getAllTables(param: TRequestParam): TTableResult; stdcall; external 'oimenuapi.dll';
  function createTable(param: TRequestParam; table: TTable): TTableResult; stdcall; external 'oimenuapi.dll';
  function batchTables(param: TRequestParam; tables: TListTable): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function updateTable(param: TRequestParam; table: TTable): TTableResult; stdcall; external 'oimenuapi.dll';
  function deleteTable(param: TRequestParam; id: Integer): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function getAllCards(param: TRequestParam): TCardResult; stdcall; external 'oimenuapi.dll';
  function createCard(param: TRequestParam; card: TCard): TCardResult; stdcall; external 'oimenuapi.dll';
  function batchCards(param: TRequestParam; cards: TListCard): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function updateCard(param: TRequestParam; card: TCard): TCardResult; stdcall; external 'oimenuapi.dll';
  function deleteCard(param: TRequestParam; id: Integer): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function getAllUsers(param: TRequestParam): TUserResult; stdcall; external 'oimenuapi.dll';
  function createUser(param: TRequestParam; user: TUser): TUserResult; stdcall; external 'oimenuapi.dll';
  function batchUsers(param: TRequestParam; users: TListUser): TSimpleResult; stdcall; external 'oimenuapi.dll';
  function updateUser(param: TRequestParam; user: TUser): TUserResult; stdcall; external 'oimenuapi.dll';
  function deleteUser(param: TRequestParam; id: Integer): TSimpleResult; stdcall; external 'oimenuapi.dll';


implementation

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

  //BILL

   Constructor TBillResult.Create;
  begin
    data := TBillItem.Create;
  end;

  Destructor TBillResult.Destroy;
  begin
    FreeAndNil(data);
  end;

  Constructor TBillItem.Create;
  begin
    items := TListOrderItem.Create;
  end;

  Destructor TBillItem.Destroy;
  begin
    FreeAndNil(items);
  end;

  //EVENT

  Constructor TEventResult.Create;
  begin
    data := TListEvent.Create;
  end;

  Destructor TEventResult.Destroy;
  begin
    FreeAndNil(data);
  end;

  function TListEvent.GetItems(Index: Integer): TEvent;
  begin
    Result := TEvent(inherited Items[Index]);
  end;

  procedure TListEvent.SetItems(Index: Integer;
  const Value: TEvent);
  begin
    inherited Items[Index] := Value;
  end;

  function TListEvent.Add(AObject: TEvent): Integer;
  begin
    Result := inherited Add(AObject);
  end;

  Constructor TEventCallWaiter.Create;
  begin
    options := TStringList.Create;
  end;

  Destructor TEventCallWaiter.Destroy;
  begin
    FreeAndNil(options);
  end;

  //PRODUCT
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



end.
