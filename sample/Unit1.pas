unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms,
  Dialogs, StdCtrls, OiMenuUtil, Controls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnCreateProduct: TButton;
    btnBatchProduct: TButton;
    btnUpdateProduct: TButton;
    btnDeleteProduct: TButton;
    btnGetAllOrders: TButton;
    btnSetOrderAsReceived: TButton;
    btnCloseTable: TButton;
    btnCancelTable: TButton;
    btnCancelTableItem: TButton;
    btnGetAllTables: TButton;
    btnCloseCard: TButton;
    btnCancelTableItemQtd: TButton;
    btnCancelCard: TButton;
    btnCancelCardItem: TButton;
    btnCancelCardItemQtd: TButton;
    btnCreateTable: TButton;
    btnBatchTables: TButton;
    btnUpdateTable: TButton;
    btnDeleteTable: TButton;
    btnGetAllCard: TButton;
    btnCreateCard: TButton;
    btnBatchCards: TButton;
    btnUpdateCard: TButton;
    btbnDeleteCard: TButton;
    btnGetAllUsers: TButton;
    btnCreateUser: TButton;
    btnBatchUser: TButton;
    btnUpdateUser: TButton;
    btnDeleteUser: TButton;
    btnTransferTable: TButton;
    btnCreateTableItem: TButton;
    btnUpdateTableItem: TButton;
    btnTrasnferTableItem: TButton;
    btnTrasnferTableItemQtd: TButton;
    btnUpdateCardItem: TButton;
    btnCreateCardItem: TButton;
    btnTransferCard: TButton;
    btnTransferCardItem: TButton;
    btnTransferCardItemQtd: TButton;
    btnGetAllEvents: TButton;
    btnSetEventAsReceived: TButton;
    btnReopenTable: TButton;
    btnReopenCard: TButton;
    btnGetTableBill: TButton;
    btnGetCardBill: TButton;

    procedure btnCreateProductClick(Sender: TObject);
    procedure btnBatchProductClick(Sender: TObject);
    procedure btnUpdateProductClick(Sender: TObject);
    procedure btnDeleteProductClick(Sender: TObject);
    procedure btnGetAllOrdersClick(Sender: TObject);
    procedure btnSetOrderAsReceivedClick(Sender: TObject);
    procedure btnCloseTableClick(Sender: TObject);
    procedure btnCancelTableClick(Sender: TObject);
    procedure btnCancelTableItemClick(Sender: TObject);
    procedure btnCancelTableItemQtdClick(Sender: TObject);
    procedure btnCloseCardClick(Sender: TObject);
    procedure btnCancelCardClick(Sender: TObject);
    procedure btnCancelCardItemClick(Sender: TObject);
    procedure btnCancelCardItemQtdClick(Sender: TObject);
    procedure btnGetAllTablesClick(Sender: TObject);
    procedure btnCreateTableClick(Sender: TObject);
    procedure btnBatchTablesClick(Sender: TObject);
    procedure btnUpdateTableClick(Sender: TObject);
    procedure btnDeleteTableClick(Sender: TObject);
    procedure btnGetAllCardClick(Sender: TObject);
    procedure btnCreateCardClick(Sender: TObject);
    procedure btnBatchCardsClick(Sender: TObject);
    procedure btnUpdateCardClick(Sender: TObject);
    procedure btbnDeleteCardClick(Sender: TObject);
    procedure btnGetAllUsersClick(Sender: TObject);
    procedure btnCreateUserClick(Sender: TObject);
    procedure btnBatchUserClick(Sender: TObject);
    procedure btnUpdateUserClick(Sender: TObject);
    procedure btnDeleteUserClick(Sender: TObject);
    procedure btnTransferTableClick(Sender: TObject);
    procedure btnCreateTableItemClick(Sender: TObject);
    procedure btnUpdateTableItemClick(Sender: TObject);
    procedure btnTrasnferTableItemClick(Sender: TObject);
    procedure btnTrasnferTableItemQtdClick(Sender: TObject);
    procedure btnTransferCardClick(Sender: TObject);
    procedure btnCreateCardItemClick(Sender: TObject);
    procedure btnUpdateCardItemClick(Sender: TObject);
    procedure btnTransferCardItemClick(Sender: TObject);
    procedure btnTransferCardItemQtdClick(Sender: TObject);
    procedure btnGetAllEventsClick(Sender: TObject);
    procedure btnSetEventAsReceivedClick(Sender: TObject);
    procedure btnReopenTableClick(Sender: TObject);
    procedure btnReopenCardClick(Sender: TObject);
    procedure btnGetTableBillClick(Sender: TObject);
    procedure btnGetCardBillClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  apiParameter: TRequestParam;

const
    TOKEN = 'OIMENU-TOKEN';
    CUSTOMURL = '';
implementation


{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
    apiParameter := TRequestParam.create;
    apiParameter.token := TOKEN;
    apiParameter.customUrl := CUSTOMURL;

end;


procedure TForm1.btnCreateProductClick(Sender: TObject);
var
  productResult : TProductResult;
  product : TProduct;
begin
  product := TProduct.Create;
  product.code := '1062';
  product.name := 'Chopp da Casa 600ml';
  product.price := 6.50;
  product.extraFields := '{"any_field":1}';

  productResult := createProduct(apiParameter, product);

  memo1.Lines.Clear;
  if (productResult.success) then
  begin
    product := productResult.data.Items[0];
    memo1.Lines.Add(product.name);
    memo1.Lines.Add(FloatToStr(product.price));
  end else begin
    memo1.Lines.Add(productResult.message);
  end;
end;

procedure TForm1.btnBatchProductClick(Sender: TObject);
var
  simpleResult: TSimpleResult;
  listProduct: TListProduct;
  product1, product2, product3: TProduct;
begin

  product1 := TProduct.Create;
  product1.code := '107';
  product1.name := 'Chopp 300ml';
  product1.price := 5.90;

  product2 := TProduct.Create;
  product2.code := '108';
  product2.name := 'Chopp 600ml';
  product2.price := 9.90;

  product3 := TProduct.Create;
  product3.code := '109';
  product3.name := 'Chopp Artesanal 300ml';
  product3.price := 12.00;

  listProduct := TListProduct.Create;
  listProduct.Add(product1);
  listProduct.Add(product2);
  listProduct.Add(product3);

  simpleResult := batchProducts(apiParameter, listProduct);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;

end;

procedure TForm1.btnUpdateProductClick(Sender: TObject);
var
  productResult : TProductResult;
  product : TProduct;
begin
  product := TProduct.Create;
  product.code := '109';
  product.name := 'Cerveja Artesanal Suave 300ml';
  product.price := 11.90;

  productResult := updateProduct(apiParameter, product);

  memo1.Lines.Clear;
  if (productResult.success) then
  begin
    product := productResult.data.Items[0];
    memo1.Lines.Add(product.name);
  end else begin
    memo1.Lines.Add(productResult.message);
  end;

end;

procedure TForm1.btnDeleteProductClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := deleteProduct(apiParameter, '107');

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;
end;

procedure TForm1.btnGetAllOrdersClick(Sender: TObject);
var
  orderResult : TOrderResult;
  order : TOrder;
  orderItem : TOrderItem;
  x, y: Integer;
begin
  orderResult := getAllOrders(apiParameter);

  memo1.Lines.Clear;
  if (orderResult.success) then
  begin
    for x := 0 to orderResult.data.Count - 1 do
    begin
      order := orderResult.data.Items[x];
      memo1.Lines.Add(order.id);
      memo1.Lines.Add(IntToStr(order.table));
      memo1.Lines.Add(IntToStr(order.card));
      for y := 0 to order.items.Count - 1 do
      begin
        orderItem := order.items.Items[y];
        memo1.Lines.Add('  '+orderItem.id);
        memo1.Lines.Add('  '+orderItem.code);
        memo1.Lines.Add('  '+orderItem.name);
        memo1.Lines.Add('  '+IntToStr(orderItem.quantity));
        memo1.Lines.Add('  '+FloatToStr(orderItem.price));
        memo1.Lines.Add('  ');
      end;
    end;
  end else begin
    memo1.Lines.Add(orderResult.message);
  end;

end;

procedure TForm1.btnSetOrderAsReceivedClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := setOrderAsReceived(apiParameter, '419096ca-8097-4828-9844-ac3a06adf658');

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;
end;

procedure TForm1.btnCloseTableClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := closeTable(apiParameter, 1);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;

end;

procedure TForm1.btnCancelTableClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := cancelTable(apiParameter, 1);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;

end;

procedure TForm1.btnCancelTableItemClick(Sender: TObject);
var
  itemResult  : TItemResult;
  x: Integer;
begin
  itemResult := cancelTableItem(apiParameter, 1, 'ASDF');

  memo1.Lines.Clear;
  if (itemResult.success) then
  begin
     memo1.Lines.Add(itemResult.data.name);
  end else begin
    memo1.Lines.Add(itemResult.message);
  end;

end;

procedure TForm1.btnCancelTableItemQtdClick(Sender: TObject);
var
  itemResult  : TItemResult;
  x: Integer;
begin
  itemResult := cancelTableItemQtd(apiParameter, 121, 'ASD', 1);

  memo1.Lines.Clear;
  if (itemResult.success) then
  begin
     memo1.Lines.Add(itemResult.data.name);
  end else begin
    memo1.Lines.Add(itemResult.message);
  end;

end;

procedure TForm1.btnGetTableBillClick(Sender: TObject);
var
  billResult : TBillResult;
  order : TOrder;
  orderItem : TOrderItem;
  x, y: Integer;
begin
  billResult := getTableBill(apiParameter, 5);

  memo1.Lines.Clear;
  memo1.Lines.Add('TOTAL  ' + FloatToStr(billResult.data.total));
  if (billResult.success) then
  begin
    for x := 0 to billResult.data.items.Count - 1 do
    begin
        orderItem := billResult.data.items.Items[x];
        memo1.Lines.Add('  '+orderItem.id);
        memo1.Lines.Add('  '+orderItem.code);
        memo1.Lines.Add('  '+orderItem.name);
        memo1.Lines.Add('  '+IntToStr(orderItem.quantity));
        memo1.Lines.Add('  '+FloatToStr(orderItem.price));
        memo1.Lines.Add('  ');
    end;
  end else begin
    memo1.Lines.Add(billResult.message);
  end;

end;

procedure TForm1.btnCloseCardClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := closeCard(apiParameter, 1);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;

end;

procedure TForm1.btnCancelCardClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := cancelCard(apiParameter, 1);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;

end;

procedure TForm1.btnCancelCardItemClick(Sender: TObject);
var
  itemResult  : TItemResult;
  x: Integer;
begin
  itemResult := cancelCardItem(apiParameter, 1, 'ASDF');

  memo1.Lines.Clear;
  if (itemResult.success) then
  begin
     memo1.Lines.Add(itemResult.data.name);
  end else begin
    memo1.Lines.Add(itemResult.message);
  end;

end;

procedure TForm1.btnCancelCardItemQtdClick(Sender: TObject);
var
  itemResult  : TItemResult;
  x: Integer;
begin
  itemResult := cancelCardItemQtd(apiParameter, 121, 'ASD', 1);

  memo1.Lines.Clear;
  if (itemResult.success) then
  begin
     memo1.Lines.Add(itemResult.data.name);
  end else begin
    memo1.Lines.Add(itemResult.message);
  end;

end;

procedure TForm1.btnGetAllTablesClick(Sender: TObject);
var
  tableResult : TTableResult;
  table : TTable;
  x: Integer;
begin
  tableResult := getAllTables(apiParameter);

  memo1.Lines.Clear;
  if (tableResult.success) then
  begin
    for x := 0 to tableResult.data.Count - 1 do
    begin
      table := tableResult.data.Items[x];
      memo1.Lines.Add(IntToStr(table.code));
      memo1.Lines.Add(table.name);
    end;
  end else begin
    memo1.Lines.Add(tableResult.message);
  end;

end;

procedure TForm1.btnCreateTableClick(Sender: TObject);
var
  tableResult : TTableResult;
  table : TTable;
begin
  table := TTable.Create;
  table.code := 4;
  table.name := 'Mesa 4';
  table.servicePercentage := 10.00;

  tableResult := createTable(apiParameter, table);

  memo1.Lines.Clear;
  if (tableResult.success) then
  begin
    table := tableResult.data.Items[0];
    memo1.Lines.Add(table.name);
  end else begin
    memo1.Lines.Add(tableResult.message);
  end;

end;

procedure TForm1.btnBatchTablesClick(Sender: TObject);
var
  simpleResult: TSimpleResult;
  listTable: TListTable;
  table1, table2, table3: TTable;
begin

  table1 := TTable.Create;
  table1.code := 5;
  table1.name := 'Mesa 5';
  table1.servicePercentage := 10.00;

  table2 := TTable.Create;
  table2.code := 6;
  table2.name := 'Mesa 6 - Central';
  table2.servicePercentage := 10.00;

  table3 := TTable.Create;
  table3.code := 7;
  table3.name := 'Mesa 7 - Especial';
  table3.servicePercentage := 10.00;

  listTable := TListTable.Create;
  listTable.Add(table1);
  listTable.Add(table2);
  listTable.Add(table3);

  simpleResult := batchTables(apiParameter, listTable);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;

end;

procedure TForm1.btnUpdateTableClick(Sender: TObject);
var
  tableResult : TTableResult;
  table : TTable;
begin
  table := TTable.Create;
  table.code := 7;
  table.name := 'Mesa 7 - Área externa';
  table.servicePercentage := 10.00;

  tableResult := updateTable(apiParameter, table);

  memo1.Lines.Clear;
  if (tableResult.success) then
  begin
    table := tableResult.data.Items[0];
    memo1.Lines.Add(table.name);
  end else begin
    memo1.Lines.Add(tableResult.message);
  end;

end;

procedure TForm1.btnDeleteTableClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := deleteTable(apiParameter, 7);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;
end;

procedure TForm1.btnGetAllCardClick(Sender: TObject);
var
  cardResult : TCardResult;
  card : TCard;
  x: Integer;
begin
  cardResult := getAllCards(apiParameter);

  memo1.Lines.Clear;
  if (cardResult.success) then
  begin
    for x := 0 to cardResult.data.Count - 1 do
    begin
      card := cardResult.data.Items[x];
      memo1.Lines.Add(IntToStr(card.code));
      memo1.Lines.Add(card.qrCode);
    end;
  end else begin
    memo1.Lines.Add(cardResult.message);
  end;
end;

procedure TForm1.btnCreateCardClick(Sender: TObject);
var
  cardResult : TCardResult;
  card : TCard;
begin
  card := TCard.Create;
  card.code := 4;
  card.qrCode := 'qr-code-4';
  card.servicePercentage := 10.00;

  cardResult := createCard(apiParameter, card);

  memo1.Lines.Clear;
  if (cardResult.success) then
  begin
    card := cardResult.data.Items[0];
    memo1.Lines.Add(card.qrCode);
  end else begin
    memo1.Lines.Add(cardResult.message);
  end;
end;

procedure TForm1.btnBatchCardsClick(Sender: TObject);
var
  simpleResult: TSimpleResult;
  listCard: TListCard;
  card1, card2, card3: TCard;
begin
  card1 := TCard.Create;
  card1.code := 5;
  card1.qrCode := 'qr-code-5';
  card1.servicePercentage := 10.00;

  card2 := TCard.Create;
  card2.code := 6;
  card2.qrCode := 'qr-code-6';
  card2.servicePercentage := 10.00;

  card3 := TCard.Create;
  card3.code := 7;
  card3.qrCode := 'qr-code-7';
  card3.servicePercentage := 10.00;

  listCard := TListCard.Create;
  listCard.Add(card1);
  listCard.Add(card2);
  listCard.Add(card3);

  simpleResult := batchCards(apiParameter, listCard);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;
end;


procedure TForm1.btnUpdateCardClick(Sender: TObject);
var
  cardResult : TCardResult;
  card : TCard;
begin
  card := TCard.Create;
  card.code := 7;
  card.qrCode := 'qr-code-7-atualizado';
  card.servicePercentage := 15.00;

  cardResult := updateCard(apiParameter, card);

  memo1.Lines.Clear;
  if (cardResult.success) then
  begin
    card := cardResult.data.Items[0];
    memo1.Lines.Add(card.qrCode);
  end else begin
    memo1.Lines.Add(cardResult.message);
  end;
end;

procedure TForm1.btbnDeleteCardClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := deleteCard(apiParameter, 7);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;
end;

procedure TForm1.btnGetAllUsersClick(Sender: TObject);
var
  userResult : TUserResult;
  user : TUser;
  x: Integer;
begin
  userResult := getAllUsers(apiParameter);

  memo1.Lines.Clear;
  if (userResult.success) then
  begin
    for x := 0 to userResult.data.Count - 1 do
    begin
      user := userResult.data.Items[x];
      memo1.Lines.Add(user.name);
    end;
  end else begin
    memo1.Lines.Add(userResult.message);
  end;
end;

procedure TForm1.btnCreateUserClick(Sender: TObject);
var
  userResult : TUserResult;
  user : TUser;
begin
  user := TUser.Create;
  user.code := 3;
  user.name := 'Beltrano';
  user.active := true;

  userResult := createUser(apiParameter, user);

  memo1.Lines.Clear;
  if (userResult.success) then
  begin
    user := userResult.data.Items[0];
    memo1.Lines.Add(user.name);
  end else begin
    memo1.Lines.Add(userResult.message);
  end;

end;

procedure TForm1.btnBatchUserClick(Sender: TObject);
var
  simpleResult: TSimpleResult;
  listUser: TListUser;
  user1, user2, user3: TUser;
begin
  user1 := TUser.Create;
  user1.code := 1;
  user1.name := 'Fulano';
  user1.active := true;

  user2 := TUser.Create;
  user2.code := 2;
  user2.name := 'Sicrano';
  user2.active := false;

  user3 := TUser.Create;
  user3.code := 3;
  user3.name := 'Beltrano';
  user3.active := true;

  listUser := TListUser.Create;
  listUser.Add(user1);
  listUser.Add(user2);
  listUser.Add(user3);

  simpleResult := batchUsers(apiParameter, listUser);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;

end;

procedure TForm1.btnUpdateUserClick(Sender: TObject);
var
  userResult : TUserResult;
  user : TUser;
begin
  user := TUser.Create;
  user.code := 3;
  user.name := 'Beltrano da Silva';
  user.active := false;

  userResult := updateUser(apiParameter, user);

  memo1.Lines.Clear;
  if (userResult.success) then
  begin
    user := userResult.data.Items[0];
    memo1.Lines.Add(user.name);
  end else begin
    memo1.Lines.Add(userResult.message);
  end;
end;

procedure TForm1.btnDeleteUserClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := deleteUser(apiParameter, 7);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;
end;

procedure TForm1.btnTransferTableClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := transferTable(apiParameter, 2, 1);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;

end;

procedure TForm1.btnCreateTableItemClick(Sender: TObject);
var
  itemResult : TItemResult;
  product : TOrderProduct;
  item: TOrderItem;
begin
  product := TOrderProduct.Create;
  product.code := '1062';
  product.name := 'Chopp da Casa 600ml';
  product.price := 6.50;
  product.quantity := 1;

  itemResult := createTableItem(apiParameter, 2, product);

  memo1.Lines.Clear;
  if (itemResult.success) then
  begin
    item := itemResult.data;
    memo1.Lines.Add(item.name);
    memo1.Lines.Add(IntToStr(item.quantity));
    memo1.Lines.Add(FloatToStr(item.price));
  end else begin
    memo1.Lines.Add(itemResult.message);
  end;

end;

procedure TForm1.btnUpdateTableItemClick(Sender: TObject);
var
  itemResult : TItemResult;
  item: TOrderItem;
begin
  itemResult := updateTableItem(apiParameter, 1, 'ASDF', 16, 2.90);

  memo1.Lines.Clear;
  if (itemResult.success) then
  begin
    item := itemResult.data;
    memo1.Lines.Add(item.name);
  end else begin
    memo1.Lines.Add(itemResult.message);
  end;

end;

procedure TForm1.btnTrasnferTableItemClick(Sender: TObject);
var
  itemResult : TItemResult;
  item: TOrderItem;
begin
  itemResult := transferTableItem(apiParameter, 2, 1, 'ASDF');

  memo1.Lines.Clear;
  if (itemResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(itemResult.message);
  end;

end;

procedure TForm1.btnTrasnferTableItemQtdClick(Sender: TObject);
var
  itemResult : TItemResult;
  item: TOrderItem;
begin
  itemResult := transferTableItemQtd(apiParameter, 1, 2, 'ASDF', 1);

  memo1.Lines.Clear;
  if (itemResult.success) then
  begin
    item := itemResult.data;
    memo1.Lines.Add(item.name);
  end else begin
    memo1.Lines.Add(itemResult.message);
  end;

end;

procedure TForm1.btnTransferCardClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := transferCard(apiParameter, 1, 2);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;

end;

procedure TForm1.btnCreateCardItemClick(Sender: TObject);
var
  itemResult : TItemResult;
  product : TOrderProduct;
  item: TOrderItem;
begin
  product := TOrderProduct.Create;
  product.code := '106';
  product.name := 'Chopp da Casa 600ml';
  product.price := 6.50;
  product.quantity := 1;

  itemResult := createCardItem(apiParameter, 1, product);

  memo1.Lines.Clear;
  if (itemResult.success) then
  begin
    item := itemResult.data;
    memo1.Lines.Add(item.name);
  end else begin
    memo1.Lines.Add(itemResult.message);
  end;

end;

procedure TForm1.btnUpdateCardItemClick(Sender: TObject);
var
  itemResult : TItemResult;
  item: TOrderItem;
begin
  itemResult := updateCardItem(apiParameter, 1, 'id_product', 1, 2.90);

  memo1.Lines.Clear;
  if (itemResult.success) then
  begin
    item := itemResult.data;
    memo1.Lines.Add(item.name);
  end else begin
    memo1.Lines.Add(itemResult.message);
  end;

end;

procedure TForm1.btnTransferCardItemClick(Sender: TObject);
var
  itemResult : TItemResult;
  item: TOrderItem;
begin
  itemResult := transferCardItem(apiParameter, 1, 2, 'id_product');

  memo1.Lines.Clear;
  if (itemResult.success) then
  begin
    item := itemResult.data;
    memo1.Lines.Add(item.name);
  end else begin
    memo1.Lines.Add(itemResult.message);
  end;

end;

procedure TForm1.btnTransferCardItemQtdClick(Sender: TObject);
var
  itemResult : TItemResult;
  item: TOrderItem;
begin
  itemResult := transferCardItemQtd(apiParameter, 1, 2, 'id_product', 1);

  memo1.Lines.Clear;
  if (itemResult.success) then
  begin
    item := itemResult.data;
    memo1.Lines.Add(item.name);
  end else begin
    memo1.Lines.Add(itemResult.message);
  end;

end;

procedure TForm1.btnGetAllEventsClick(Sender: TObject);
var
  eventResult : TEventResult;
  event : TEvent;
  x, y: Integer;
begin
  eventResult := getAllEvents(apiParameter);

  memo1.Lines.Clear;
  if (eventResult.success) then
  begin
    for x := 0 to eventResult.data.Count - 1 do
    begin
      event := eventResult.data.Items[x];
      memo1.Lines.Add(event.id);
      memo1.Lines.Add(event.date);
      memo1.Lines.Add(event.eventType);
      if (event.eventType = 'the-check') then
      begin
        memo1.Lines.Add('  '+TEventTheCheck(event.data).table);
        memo1.Lines.Add('  '+TEventTheCheck(event.data).card);
        memo1.Lines.Add('  '+TEventTheCheck(event.data).waiter);
        memo1.Lines.Add('  '+TEventTheCheck(event.data).splitWith);
      end else if (event.eventType = 'call-waiter') then
      begin
        memo1.Lines.Add('  '+TEventCallWaiter(event.data).table);
        memo1.Lines.Add('  '+TEventCallWaiter(event.data).waiter);
        memo1.Lines.Add('  '+TEventCallWaiter(event.data).options.Text);
      end;
    end;
  end else begin
    memo1.Lines.Add(eventResult.message);
  end;

end;

procedure TForm1.btnSetEventAsReceivedClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := setEventAsReceived(apiParameter, '1e7b5784-40b3-48cb-9019-29dd4cf72aaf');

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;
end;

procedure TForm1.btnReopenTableClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := reopenTable(apiParameter, 1);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;


end;

procedure TForm1.btnReopenCardClick(Sender: TObject);
var
  simpleResult : TSimpleResult;
begin
  simpleResult := reopenCard(apiParameter, 1);

  memo1.Lines.Clear;
  if (simpleResult.success) then
  begin
    memo1.Lines.Add('OK');
  end else begin
    memo1.Lines.Add(simpleResult.message);
  end;

end;

procedure TForm1.btnGetCardBillClick(Sender: TObject);
var
  billResult : TBillResult;
  order : TOrder;
  orderItem : TOrderItem;
  x, y: Integer;
begin
  billResult := getCardBill(apiParameter, 5);

  memo1.Lines.Clear;
  memo1.Lines.Add('TOTAL  ' + FloatToStr(billResult.data.total));
  if (billResult.success) then
  begin
    for x := 0 to billResult.data.items.Count - 1 do
    begin
        orderItem := billResult.data.items.Items[x];
        memo1.Lines.Add('  '+orderItem.id);
        memo1.Lines.Add('  '+orderItem.code);
        memo1.Lines.Add('  '+orderItem.name);
        memo1.Lines.Add('  '+IntToStr(orderItem.quantity));
        memo1.Lines.Add('  '+FloatToStr(orderItem.price));
        memo1.Lines.Add('  ');
    end;
  end else begin
    memo1.Lines.Add(billResult.message);
  end;

end;

end.
