object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 0
    Top = 221
    Width = 153
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 0
    Top = 134
    Width = 320
    Height = 23
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 0
    Top = 163
    Width = 320
    Height = 23
    TabOrder = 2
  end
  object Button2: TButton
    Left = 168
    Top = 221
    Width = 152
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 8
    Width = 320
    Height = 120
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 0
    Top = 192
    Width = 320
    Height = 23
    TabOrder = 5
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\heber\OneDrive\Documentos\BANCO_ALEATORIO.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=IB')
    Left = 32
    Top = 261
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 112
    Top = 261
  end
  object FDTable1: TFDTable
    Connection = FDConnection1
    Left = 240
    Top = 261
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 176
    Top = 261
  end
  object DataSource1: TDataSource
    Left = 152
    Top = 317
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 48
    Top = 317
  end
end
