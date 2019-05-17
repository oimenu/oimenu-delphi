object Form1: TForm1
  Left = 255
  Top = 178
  Width = 812
  Height = 708
  Caption = 'OiMenu Demo DLL 1.0'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnCreateProduct: TButton
    Left = 8
    Top = 8
    Width = 185
    Height = 25
    Caption = 'createProduct'
    TabOrder = 0
    OnClick = btnCreateProductClick
  end
  object Memo1: TMemo
    Left = 24
    Top = 488
    Width = 745
    Height = 161
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object btnBatchProduct: TButton
    Left = 8
    Top = 40
    Width = 185
    Height = 25
    Caption = 'batchProduct'
    TabOrder = 2
    OnClick = btnBatchProductClick
  end
  object btnUpdateProduct: TButton
    Left = 8
    Top = 72
    Width = 185
    Height = 25
    Caption = 'updateProduct'
    TabOrder = 3
    OnClick = btnUpdateProductClick
  end
  object btnDeleteProduct: TButton
    Left = 8
    Top = 104
    Width = 185
    Height = 25
    Caption = 'deleteProduct'
    TabOrder = 4
    OnClick = btnDeleteProductClick
  end
  object btnGetAllOrders: TButton
    Left = 200
    Top = 8
    Width = 185
    Height = 25
    Caption = 'getAllOrders'
    TabOrder = 5
    OnClick = btnGetAllOrdersClick
  end
  object btnSetOrderAsReceived: TButton
    Left = 200
    Top = 40
    Width = 185
    Height = 25
    Caption = 'setOrderAsReceived'
    TabOrder = 6
    OnClick = btnSetOrderAsReceivedClick
  end
  object btnCloseTable: TButton
    Left = 392
    Top = 8
    Width = 185
    Height = 25
    Caption = 'closeTable'
    TabOrder = 7
    OnClick = btnCloseTableClick
  end
  object btnCancelTable: TButton
    Left = 392
    Top = 72
    Width = 185
    Height = 25
    Caption = 'cancelTable'
    TabOrder = 8
    OnClick = btnCancelTableClick
  end
  object btnCancelTableItem: TButton
    Left = 392
    Top = 232
    Width = 185
    Height = 25
    Caption = 'cancelTableItem'
    TabOrder = 9
    OnClick = btnCancelTableItemClick
  end
  object btnGetAllTables: TButton
    Left = 16
    Top = 328
    Width = 185
    Height = 25
    Caption = 'getAllTables'
    TabOrder = 10
    OnClick = btnGetAllTablesClick
  end
  object btnCloseCard: TButton
    Left = 584
    Top = 8
    Width = 185
    Height = 25
    Caption = 'closeCard'
    TabOrder = 11
    OnClick = btnCloseCardClick
  end
  object btnCancelTableItemQtd: TButton
    Left = 392
    Top = 264
    Width = 185
    Height = 25
    Caption = 'cancelTableItem (Qtd)'
    TabOrder = 12
    OnClick = btnCancelTableItemQtdClick
  end
  object btnCancelCard: TButton
    Left = 584
    Top = 72
    Width = 185
    Height = 25
    Caption = 'cancelCard'
    TabOrder = 13
    OnClick = btnCancelCardClick
  end
  object btnCancelCardItem: TButton
    Left = 584
    Top = 232
    Width = 185
    Height = 25
    Caption = 'cancelCardItem'
    TabOrder = 14
    OnClick = btnCancelCardItemClick
  end
  object btnCancelCardItemQtd: TButton
    Left = 584
    Top = 264
    Width = 185
    Height = 25
    Caption = 'cancelCardItem (Qtd)'
    TabOrder = 15
    OnClick = btnCancelCardItemQtdClick
  end
  object btnCreateTable: TButton
    Left = 16
    Top = 360
    Width = 185
    Height = 25
    Caption = 'createTable'
    TabOrder = 16
    OnClick = btnCreateTableClick
  end
  object btnBatchTables: TButton
    Left = 16
    Top = 392
    Width = 185
    Height = 25
    Caption = 'batchTables'
    TabOrder = 17
    OnClick = btnBatchTablesClick
  end
  object btnUpdateTable: TButton
    Left = 16
    Top = 424
    Width = 185
    Height = 25
    Caption = 'updateTable'
    TabOrder = 18
    OnClick = btnUpdateTableClick
  end
  object btnDeleteTable: TButton
    Left = 16
    Top = 456
    Width = 185
    Height = 25
    Caption = 'deleteTable'
    TabOrder = 19
    OnClick = btnDeleteTableClick
  end
  object btnGetAllCard: TButton
    Left = 208
    Top = 328
    Width = 185
    Height = 25
    Caption = 'getAllCards'
    TabOrder = 20
    OnClick = btnGetAllCardClick
  end
  object btnCreateCard: TButton
    Left = 208
    Top = 360
    Width = 185
    Height = 25
    Caption = 'createCard'
    TabOrder = 21
    OnClick = btnCreateCardClick
  end
  object btnBatchCards: TButton
    Left = 208
    Top = 392
    Width = 185
    Height = 25
    Caption = 'batchCards'
    TabOrder = 22
    OnClick = btnBatchCardsClick
  end
  object btnUpdateCard: TButton
    Left = 208
    Top = 424
    Width = 185
    Height = 25
    Caption = 'updateCard'
    TabOrder = 23
    OnClick = btnUpdateCardClick
  end
  object btbnDeleteCard: TButton
    Left = 208
    Top = 456
    Width = 185
    Height = 25
    Caption = 'deleteCard'
    TabOrder = 24
    OnClick = btbnDeleteCardClick
  end
  object btnGetAllUsers: TButton
    Left = 400
    Top = 328
    Width = 185
    Height = 25
    Caption = 'getAllUsers'
    TabOrder = 25
    OnClick = btnGetAllUsersClick
  end
  object btnCreateUser: TButton
    Left = 400
    Top = 360
    Width = 185
    Height = 25
    Caption = 'createUser'
    TabOrder = 26
    OnClick = btnCreateUserClick
  end
  object btnBatchUser: TButton
    Left = 400
    Top = 392
    Width = 185
    Height = 25
    Caption = 'batchUser'
    TabOrder = 27
    OnClick = btnBatchUserClick
  end
  object btnUpdateUser: TButton
    Left = 400
    Top = 424
    Width = 185
    Height = 25
    Caption = 'updateUser'
    TabOrder = 28
    OnClick = btnUpdateUserClick
  end
  object btnDeleteUser: TButton
    Left = 400
    Top = 456
    Width = 185
    Height = 25
    Caption = 'deleteUser'
    TabOrder = 29
    OnClick = btnDeleteUserClick
  end
  object btnTransferTable: TButton
    Left = 392
    Top = 40
    Width = 185
    Height = 25
    Caption = 'trasnferTable'
    TabOrder = 30
    OnClick = btnTransferTableClick
  end
  object btnCreateTableItem: TButton
    Left = 392
    Top = 104
    Width = 185
    Height = 25
    Caption = 'crateTableItem'
    TabOrder = 31
    OnClick = btnCreateTableItemClick
  end
  object btnUpdateTableItem: TButton
    Left = 392
    Top = 136
    Width = 185
    Height = 25
    Caption = 'updateTableItem'
    TabOrder = 32
    OnClick = btnUpdateTableItemClick
  end
  object btnTrasnferTableItem: TButton
    Left = 392
    Top = 168
    Width = 185
    Height = 25
    Caption = 'transferTableItem'
    TabOrder = 33
    OnClick = btnTrasnferTableItemClick
  end
  object btnTrasnferTableItemQtd: TButton
    Left = 392
    Top = 200
    Width = 185
    Height = 25
    Caption = 'transferTableItem (Qtd)'
    TabOrder = 34
    OnClick = btnTrasnferTableItemQtdClick
  end
  object btnUpdateCardItem: TButton
    Left = 584
    Top = 136
    Width = 185
    Height = 25
    Caption = 'updateCardItem'
    TabOrder = 35
    OnClick = btnUpdateCardItemClick
  end
  object btnCreateCardItem: TButton
    Left = 584
    Top = 104
    Width = 185
    Height = 25
    Caption = 'crateCardItem'
    TabOrder = 36
    OnClick = btnCreateCardItemClick
  end
  object btnTransferCard: TButton
    Left = 584
    Top = 40
    Width = 185
    Height = 25
    Caption = 'trasnferCard'
    TabOrder = 37
    OnClick = btnTransferCardClick
  end
  object btnTransferCardItem: TButton
    Left = 584
    Top = 168
    Width = 185
    Height = 25
    Caption = 'transferCardItem'
    TabOrder = 38
    OnClick = btnTransferCardItemClick
  end
  object btnTransferCardItemQtd: TButton
    Left = 584
    Top = 200
    Width = 185
    Height = 25
    Caption = 'transferCardItem (Qtd)'
    TabOrder = 39
    OnClick = btnTransferCardItemQtdClick
  end
end
