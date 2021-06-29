object FormMain: TFormMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Curso de Tributa'#231#227'o para Programadores'
  ClientHeight = 521
  ClientWidth = 1250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnFinalizar: TButton
    Left = 8
    Top = 8
    Width = 103
    Height = 25
    Caption = 'Finalizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnFinalizarClick
  end
  object btnEnviarXML: TButton
    Left = 331
    Top = 8
    Width = 103
    Height = 25
    Caption = 'Enviar XML'
    TabOrder = 1
    OnClick = btnEnviarXMLClick
  end
  object statMain: TStatusBar
    Left = 0
    Top = 499
    Width = 1250
    Height = 22
    Panels = <>
    ExplicitWidth = 1245
  end
  object btnAuditarXML: TButton
    Left = 114
    Top = 8
    Width = 103
    Height = 25
    Caption = 'Auditar XML'
    TabOrder = 3
    OnClick = btnAuditarXMLClick
  end
  object mmoXML1: TSynMemo
    Left = 8
    Top = 39
    Width = 535
    Height = 454
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 4
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.LeftOffset = 2
    Gutter.ShowLineNumbers = True
    Gutter.Width = 25
    Highlighter = DataModuleMain.synxmlsynXML2
    MaxScrollWidth = 10240
    WordWrap = True
    FontSmoothing = fsmNone
  end
  object pgcMain: TPageControl
    Left = 552
    Top = 8
    Width = 694
    Height = 485
    ActivePage = tsEmpresa
    TabOrder = 5
    object tsEmpresa: TTabSheet
      Caption = 'Empresa'
      OnShow = tsEmpresaShow
      object lblCNPJEmit: TLabel
        Left = 81
        Top = 8
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'CNPJ'
      end
      object lblNomeEmit: TLabel
        Left = 79
        Top = 35
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome'
      end
      object lblIEEmit: TLabel
        Left = 96
        Top = 65
        Width = 10
        Height = 13
        Alignment = taRightJustify
        Caption = 'IE'
      end
      object lblCRTEmit: TLabel
        Left = 22
        Top = 89
        Width = 84
        Height = 13
        Alignment = taRightJustify
        Caption = 'Regime Tribut'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtCNPJEmit: TEdit
        Left = 112
        Top = 5
        Width = 200
        Height = 21
        TabOrder = 0
      end
      object edtNomeEmit: TEdit
        Left = 112
        Top = 32
        Width = 338
        Height = 21
        TabOrder = 1
      end
      object edtIEEmit: TEdit
        Left = 112
        Top = 62
        Width = 150
        Height = 21
        TabOrder = 2
      end
      object cbbCRTEmit: TComboBox
        Left = 112
        Top = 89
        Width = 270
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = '1 - Simples Nacional'
        Items.Strings = (
          '1 - Simples Nacional'
          '2 - Simples Nacional - excesso de sublimite da receita bruta'
          '3 - Regime Normal')
      end
      object btnSalvarEmit: TButton
        Left = 484
        Top = 6
        Width = 200
        Height = 25
        Caption = 'Salvar altera'#231#245'es'
        TabOrder = 4
        OnClick = btnSalvarEmitClick
      end
      object grp3: TGroupBox
        Left = 3
        Top = 116
        Width = 680
        Height = 181
        Caption = 'Endere'#231'o'
        TabOrder = 5
        object lblLogradouroEmit: TLabel
          Left = 48
          Top = 16
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Logradouro'
        end
        object lblNumeroEmit: TLabel
          Left = 471
          Top = 16
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#250'mero'
        end
        object lblCodCidadeEmit: TLabel
          Left = 449
          Top = 70
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'C'#243'digo IBGE'
        end
        object lblCidadeEmit: TLabel
          Left = 70
          Top = 97
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cidade'
        end
        object lblUFEmit: TLabel
          Left = 495
          Top = 97
          Width = 13
          Height = 13
          Alignment = taRightJustify
          Caption = 'UF'
        end
        object lblComplementoEmit: TLabel
          Left = 38
          Top = 43
          Width = 65
          Height = 13
          Caption = 'Complemento'
        end
        object lblCodPaisEmit: TLabel
          Left = 258
          Top = 124
          Width = 55
          Height = 13
          Caption = 'C'#243'digo Pa'#237's'
        end
        object lblPaisEmit: TLabel
          Left = 84
          Top = 151
          Width = 19
          Height = 13
          Caption = 'Pa'#237's'
        end
        object lblBairroEmit: TLabel
          Left = 75
          Top = 70
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Bairro'
        end
        object lblCEPEmit: TLabel
          Left = 84
          Top = 123
          Width = 19
          Height = 13
          Alignment = taRightJustify
          Caption = 'CEP'
        end
        object edtLogradouroEmit: TEdit
          Left = 109
          Top = 13
          Width = 329
          Height = 21
          TabOrder = 0
        end
        object edtNumeroEmit: TEdit
          Left = 514
          Top = 13
          Width = 41
          Height = 21
          TabOrder = 2
        end
        object edtCodCidadeEmit: TEdit
          Left = 514
          Top = 67
          Width = 57
          Height = 21
          TabOrder = 4
        end
        object edtCidadeEmit: TEdit
          Left = 109
          Top = 94
          Width = 329
          Height = 21
          TabOrder = 3
        end
        object cbbUFEmit: TComboBox
          Left = 514
          Top = 94
          Width = 41
          Height = 21
          TabOrder = 5
          Text = 'AC'
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
        end
        object edtComplementoEmit: TEdit
          Left = 109
          Top = 40
          Width = 329
          Height = 21
          TabOrder = 6
        end
        object edtPaisEmit: TEdit
          Left = 109
          Top = 148
          Width = 137
          Height = 21
          TabOrder = 7
        end
        object edtCodPaisEmit: TEdit
          Left = 319
          Top = 121
          Width = 57
          Height = 21
          TabOrder = 8
        end
        object edtBairroEmit: TEdit
          Left = 109
          Top = 67
          Width = 329
          Height = 21
          TabOrder = 1
        end
        object edtCEPEmit: TEdit
          Left = 109
          Top = 120
          Width = 137
          Height = 21
          TabOrder = 9
        end
      end
    end
    object tsClientes: TTabSheet
      Caption = 'Clientes'
      ImageIndex = 2
      OnShow = tsClientesShow
      object lblCNPJDest: TLabel
        Left = 81
        Top = 8
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'CNPJ'
      end
      object lblNomeDest: TLabel
        Left = 79
        Top = 35
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome'
      end
      object lblindIEDest: TLabel
        Left = 279
        Top = 62
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ind IEDest'
      end
      object lblIEDest: TLabel
        Left = 96
        Top = 62
        Width = 10
        Height = 13
        Alignment = taRightJustify
        Caption = 'IE'
      end
      object edtCNPJDest: TEdit
        Left = 112
        Top = 5
        Width = 200
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object edtNomeDest: TEdit
        Left = 112
        Top = 32
        Width = 338
        Height = 21
        TabOrder = 1
      end
      object edtIEDest: TEdit
        Left = 112
        Top = 59
        Width = 150
        Height = 21
        TabOrder = 2
      end
      object btnSalvarDest: TButton
        Left = 483
        Top = 3
        Width = 200
        Height = 25
        Caption = 'Salvar altera'#231#245'es'
        TabOrder = 3
        OnClick = btnSalvarDestClick
      end
      object dbgrdClientes: TDBGrid
        Left = 3
        Top = 270
        Width = 680
        Height = 184
        DataSource = DataModuleMain.dsQuery
        ReadOnly = True
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = dbgrdClientesCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CNPJ'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'xNome'
            Title.Caption = 'Nome'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'xMun'
            Title.Caption = 'Cidade'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'xPais'
            Title.Caption = 'Pa'#237's'
            Width = 75
            Visible = True
          end>
      end
      object btnNovoClienteDest: TButton
        Left = 483
        Top = 31
        Width = 200
        Height = 24
        Caption = 'Novo Cliente'
        TabOrder = 5
        OnClick = btnNovoClienteDestClick
      end
      object btnExcluirClienteDest: TButton
        Left = 483
        Top = 57
        Width = 200
        Height = 25
        Caption = 'Excluir Cliente'
        TabOrder = 6
        OnClick = btnExcluirClienteDestClick
      end
      object grp2: TGroupBox
        Left = 3
        Top = 83
        Width = 680
        Height = 181
        Caption = 'Endere'#231'o'
        TabOrder = 7
        object lblLogradouroDest: TLabel
          Left = 48
          Top = 16
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Logradouro'
        end
        object lblNumeroDest: TLabel
          Left = 471
          Top = 16
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#250'mero'
        end
        object lblCodCidadeDest: TLabel
          Left = 449
          Top = 70
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'C'#243'digo IBGE'
        end
        object lblCidadeDest: TLabel
          Left = 70
          Top = 97
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cidade'
        end
        object lblUFDest: TLabel
          Left = 495
          Top = 97
          Width = 13
          Height = 13
          Alignment = taRightJustify
          Caption = 'UF'
        end
        object lblComplementoDest: TLabel
          Left = 38
          Top = 43
          Width = 65
          Height = 13
          Caption = 'Complemento'
        end
        object lblCodPaisDest: TLabel
          Left = 258
          Top = 124
          Width = 55
          Height = 13
          Caption = 'C'#243'digo Pa'#237's'
        end
        object lblPaisDest: TLabel
          Left = 84
          Top = 151
          Width = 19
          Height = 13
          Caption = 'Pa'#237's'
        end
        object lblBairroDest: TLabel
          Left = 75
          Top = 70
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Bairro'
        end
        object lblCEPDest: TLabel
          Left = 84
          Top = 121
          Width = 19
          Height = 13
          Alignment = taRightJustify
          Caption = 'CEP'
        end
        object edtLogradouroDest: TEdit
          Left = 109
          Top = 13
          Width = 329
          Height = 21
          TabOrder = 0
        end
        object edtNumeroDest: TEdit
          Left = 514
          Top = 13
          Width = 41
          Height = 21
          TabOrder = 2
        end
        object edtCodCidadeDest: TEdit
          Left = 514
          Top = 67
          Width = 57
          Height = 21
          TabOrder = 4
        end
        object edtCidadeDest: TEdit
          Left = 109
          Top = 94
          Width = 329
          Height = 21
          TabOrder = 3
        end
        object cbbUFDest: TComboBox
          Left = 514
          Top = 94
          Width = 41
          Height = 21
          TabOrder = 5
          Text = 'AC'
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
        end
        object edtComplementoDest: TEdit
          Left = 109
          Top = 40
          Width = 329
          Height = 21
          TabOrder = 6
        end
        object edtPaisDest: TEdit
          Left = 109
          Top = 148
          Width = 137
          Height = 21
          TabOrder = 7
        end
        object edtCodPaisDest: TEdit
          Left = 319
          Top = 121
          Width = 57
          Height = 21
          TabOrder = 8
        end
        object edtBairroDest: TEdit
          Left = 109
          Top = 67
          Width = 329
          Height = 21
          TabOrder = 1
        end
        object edtCEPDest: TEdit
          Left = 109
          Top = 120
          Width = 137
          Height = 21
          TabOrder = 9
        end
      end
      object cbbindIEDest: TComboBox
        Left = 336
        Top = 59
        Width = 114
        Height = 21
        TabOrder = 8
        Text = '1 - Contribuinte ICMS (informar a IE do destinat'#225'rio)'
        Items.Strings = (
          '1 - Contribuinte ICMS (informar a IE do destinat'#225'rio)'
          
            '2 - Contribuinte isento de Inscri'#231#227'o no cadastro de Contribuinte' +
            's do ICMS'
          
            '9 - N'#227'o Contribuinte, que pode ou n'#227'o possuir Inscri'#231#227'o Estadual' +
            ' no Cadastro de Contribuintes do ICMS.')
      end
    end
    object tsProdutos: TTabSheet
      Caption = 'Produtos'
      ImageIndex = 2
      OnShow = tsProdutosShow
      object lblValorProd: TLabel
        Left = 50
        Top = 64
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor Unit'#225'rio'
      end
      object lblNomeProd: TLabel
        Left = 87
        Top = 37
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome'
      end
      object lblCodigoProd: TLabel
        Left = 81
        Top = 8
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'digo'
      end
      object edtNomeProd: TEdit
        Left = 120
        Top = 34
        Width = 338
        Height = 21
        TabOrder = 0
      end
      object edtCodigoProd: TEdit
        Left = 120
        Top = 5
        Width = 200
        Height = 21
        TabOrder = 1
      end
      object edtValorProd: TEdit
        Left = 120
        Top = 61
        Width = 150
        Height = 21
        TabOrder = 2
      end
      object dbgrd1: TDBGrid
        Left = 3
        Top = 270
        Width = 680
        Height = 184
        DataSource = DataModuleMain.dsQuery
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = dbgrd1CellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'cProd'
            Title.Caption = 'C'#243'digo'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'xProd'
            Title.Caption = 'Nome'
            Width = 260
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vUnCom'
            Title.Caption = 'Valor'
            Width = 80
            Visible = True
          end>
      end
      object btnSalvarProduto: TButton
        Left = 483
        Top = 3
        Width = 200
        Height = 25
        Caption = 'Salvar altera'#231#245'es'
        TabOrder = 4
        OnClick = btnSalvarProdutoClick
      end
      object btnNovoProduto: TButton
        Left = 483
        Top = 31
        Width = 200
        Height = 24
        Caption = 'Novo Produto'
        TabOrder = 5
        OnClick = btnNovoProdutoClick
      end
      object btnExcluirProduto: TButton
        Left = 483
        Top = 57
        Width = 200
        Height = 25
        Caption = 'Excluir Produto'
        TabOrder = 6
        OnClick = btnExcluirProdutoClick
      end
      object pgcCamposProd: TPageControl
        Left = 3
        Top = 88
        Width = 680
        Height = 176
        ActivePage = tsPIS
        TabOrder = 7
        object tsGeral: TTabSheet
          Caption = 'Geral'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object lblNCMProd: TLabel
            Left = 89
            Top = 11
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'NCM'
          end
          object lblCFOPProd: TLabel
            Left = 84
            Top = 38
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'CFOP'
          end
          object lblUnidadeProd: TLabel
            Left = 72
            Top = 67
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidade'
          end
          object lblUnidadeTribProd: TLabel
            Left = 21
            Top = 94
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidade Tribut'#225'vel'
          end
          object lblValorTribProd: TLabel
            Left = 16
            Top = 121
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor Un. Tribut'#225'vel'
          end
          object lblIndTotProd: TLabel
            Left = 300
            Top = 11
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ind Tot'
          end
          object edtNCMProd: TEdit
            Left = 117
            Top = 8
            Width = 150
            Height = 21
            TabOrder = 0
          end
          object edtCFOPProd: TEdit
            Left = 117
            Top = 35
            Width = 150
            Height = 21
            TabOrder = 1
          end
          object edtUnidadeProd: TEdit
            Left = 117
            Top = 64
            Width = 150
            Height = 21
            TabOrder = 2
          end
          object edtUnidadeTribProd: TEdit
            Left = 117
            Top = 91
            Width = 150
            Height = 21
            TabOrder = 3
          end
          object edtValorTribProd: TEdit
            Left = 117
            Top = 118
            Width = 150
            Height = 21
            TabOrder = 4
          end
          object cbbIndTotProd: TComboBox
            Left = 341
            Top = 8
            Width = 308
            Height = 21
            TabOrder = 5
            Text = '0 - Valor do item (vProd) n'#227'o comp'#245'e o valor total da NF-e'
            Items.Strings = (
              '0 - Valor do item (vProd) n'#227'o comp'#245'e o valor total da NF-e'
              '1 - Valor do item (vProd) comp'#245'e o valor total da NF-e')
          end
        end
        object tsICMS: TTabSheet
          Caption = 'ICMS'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 28
          object lblAliquotaProd: TLabel
            Left = 72
            Top = 91
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Aliquota'
          end
          object lblModBCProd: TLabel
            Left = 24
            Top = 64
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Mod. Base Calculo'
          end
          object lblOrigemProd: TLabel
            Left = 77
            Top = 37
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Origem'
          end
          object lblGrupoTributacaoProd: TLabel
            Left = 28
            Top = 10
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo Tributa'#231#227'o'
          end
          object edtAliquotaProd: TEdit
            Left = 117
            Top = 88
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object cbbModBCProd: TComboBox
            Left = 117
            Top = 61
            Width = 185
            Height = 21
            TabOrder = 1
            Text = '0 - Margem Valor Agregado (%)'
            Items.Strings = (
              '0 - Margem Valor Agregado (%)'
              '1 - Pauta (Valor)'
              '2 - Pre'#231'o Tabelado M'#225'x. (valor)'
              '3 - Valor da opera'#231#227'o')
          end
          object cbbOrigemProd: TComboBox
            Left = 117
            Top = 34
            Width = 540
            Height = 21
            TabOrder = 2
            Text = '0 - Nacional, exceto as indicadas nos c'#243'digos 3, 4, 5 e 8'
            Items.Strings = (
              '0 - Nacional, exceto as indicadas nos c'#243'digos 3, 4, 5 e 8'
              
                '1 - Estrangeira - Importa'#231#227'o direta, exceto a indicada no c'#243'digo' +
                ' 6'
              
                '2 - Estrangeira - Adquirida no mercado interno, exceto a indicad' +
                'a no c'#243'digo 7'
              
                '3 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o super' +
                'ior a 40% e inferior ou igual a 70%'
              
                '4 - Nacional, cuja produ'#231#227'o tenha sido feita em conformidade com' +
                ' os processos produtivos b'#225'sicos de que tratam as legisla'#231#245'es ci' +
                'tadas nos Ajustes'
              
                '5 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o infer' +
                'ior ou igual a 40%'
              
                '6 - Estrangeira - Importa'#231#227'o direta, sem similar nacional, const' +
                'ante em lista da CAMEX e g'#225's natural'
              
                '7 - Estrangeira - Adquirida no mercado interno, sem similar naci' +
                'onal, constante lista CAMEX e g'#225's natural.'
              
                '8 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o super' +
                'ior a 70%')
          end
          object cbbGrupoTributacaoProd: TComboBox
            Left = 117
            Top = 7
            Width = 540
            Height = 21
            TabOrder = 3
            Text = '00 - Tributada integralmente'
            Items.Strings = (
              '00 - Tributada integralmente'
              
                '10 - Tributada e com cobran'#231'a do ICMS por substitui'#231#227'o tribut'#225'ri' +
                'a'
              '20 - Tributa'#231#227'o com redu'#231#227'o de base de c'#225'lculo'
              
                '30 - Tributa'#231#227'o Isenta ou n'#227'o tributada e com cobran'#231'a do ICMS p' +
                'or substitui'#231#227'o tribut'#225'ria '
              '40, 41, 50 - Tributa'#231#227'o Isenta, N'#227'o tributada ou Suspens'#227'o.'
              
                '51 - Tributa'#231#227'o com Diferimento (a exig'#234'ncia do preenchimento da' +
                's informa'#231#245'es do ICMS diferido fica a crit'#233'rio de cada UF).'
              
                '60 - Tributa'#231#227'o ICMS cobrado anteriormente por substitui'#231#227'o trib' +
                'ut'#225'ria'
              
                '70 - Tributa'#231#227'o ICMS com redu'#231#227'o de base de c'#225'lculo e cobran'#231'a d' +
                'o ICMS por substitui'#231#227'o tribut'#225'ria'
              '90 - Tributa'#231#227'o ICMS: Outros')
          end
        end
        object tsICMS_CRT1: TTabSheet
          Caption = 'ICMSSN'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 28
          object lblOrigemSNProd: TLabel
            Left = 77
            Top = 11
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Origem'
          end
          object lblCSOCNProd: TLabel
            Left = 77
            Top = 38
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'CSOSN'
          end
          object cbbOrigemSNProd: TComboBox
            Left = 117
            Top = 8
            Width = 544
            Height = 21
            TabOrder = 0
            Text = '0 - Nacional, exceto as indicadas nos c'#243'digos 3, 4, 5 e 8'
            Items.Strings = (
              '0 - Nacional, exceto as indicadas nos c'#243'digos 3, 4, 5 e 8'
              
                '1 - Estrangeira - Importa'#231#227'o direta, exceto a indicada no c'#243'digo' +
                ' 6'
              
                '2 - Estrangeira - Adquirida no mercado interno, exceto a indicad' +
                'a no c'#243'digo 7'
              
                '3 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o super' +
                'ior a 40% e inferior ou igual a 70%'
              
                '4 - Nacional, cuja produ'#231#227'o tenha sido feita em conformidade com' +
                ' os processos produtivos b'#225'sicos de que tratam as legisla'#231#245'es ci' +
                'tadas nos Ajustes'
              
                '5 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o infer' +
                'ior ou igual a 40%'
              
                '6 - Estrangeira - Importa'#231#227'o direta, sem similar nacional, const' +
                'ante em lista da CAMEX e g'#225's natural'
              
                '7 - Estrangeira - Adquirida no mercado interno, sem similar naci' +
                'onal, constante lista CAMEX e g'#225's natural.'
              
                '8 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o super' +
                'ior a 70%')
          end
          object cbbCSOSNProd: TComboBox
            Left = 117
            Top = 35
            Width = 544
            Height = 21
            TabOrder = 1
            Text = '102 - Tributada pelo Simples Nacional sem permiss'#227'o de cr'#233'dito.'
            Items.Strings = (
              '102 - Tributada pelo Simples Nacional sem permiss'#227'o de cr'#233'dito.'
              
                '103 - Isen'#231#227'o do ICMS no Simples Nacional para faixa de receita ' +
                'bruta.'
              '300 - Imune.'
              '400 - N'#227'o tributada pelo Simples Nacional (v2.0)')
          end
        end
        object tsIPI: TTabSheet
          Caption = 'IPI'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object lblIPITributado: TLabel
            Left = 65
            Top = 13
            Width = 46
            Height = 13
            Caption = 'Tributado'
          end
          object lblcEnq: TLabel
            Left = 9
            Top = 40
            Width = 102
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'd. Enquadramento'
          end
          object lblIPICST: TLabel
            Left = 92
            Top = 67
            Width = 19
            Height = 13
            Caption = 'CST'
          end
          object lblpIPI: TLabel
            Left = 72
            Top = 94
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Aliquota'
            Visible = False
          end
          object cbbIPITributado: TComboBox
            Left = 117
            Top = 10
            Width = 121
            Height = 21
            TabOrder = 0
            Text = 'N'#227'o Tributado'
            OnChange = cbbIPITributadoChange
            Items.Strings = (
              'Tributado'
              'N'#227'o Tributado')
          end
          object edtcEnq: TEdit
            Left = 117
            Top = 37
            Width = 121
            Height = 21
            TabOrder = 1
            Text = '999'
          end
          object cbbIPICST: TComboBox
            Left = 117
            Top = 64
            Width = 240
            Height = 21
            TabOrder = 2
            Text = '01 - Entrada tributada com al'#237'quota zero'
            Items.Strings = (
              '01 - Entrada tributada com al'#237'quota zero'
              '02 - Entrada isenta'
              '03 - Entrada n'#227'o-tributada'
              '04 - Entrada imune'
              '05 - Entrada com suspens'#227'o'
              '51 - Sa'#237'da tributada com al'#237'quota zero'
              '52 - Sa'#237'da isenta'
              '53 - Sa'#237'da n'#227'o-tributada'
              '54 - Sa'#237'da imune'
              '55 - Sa'#237'da com suspens'#227'o')
          end
          object edtpIPI: TEdit
            Left = 117
            Top = 91
            Width = 121
            Height = 21
            TabOrder = 3
            Visible = False
          end
        end
        object tsPIS: TTabSheet
          Caption = 'PIS'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 28
          object lblPISCST1: TLabel
            Left = 88
            Top = 13
            Width = 19
            Height = 13
            Caption = 'CST'
          end
          object lblpPIS1: TLabel
            Left = 46
            Top = 40
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Aliquota (%)'
          end
          object cbbPISCST: TComboBox
            Left = 113
            Top = 10
            Width = 544
            Height = 21
            TabOrder = 0
            Text = 
              '01 - Opera'#231#227'o Tribut'#225'vel (base de c'#225'lculo = valor da opera'#231#227'o al' +
              #237'quota normal (cumulativo/n'#227'o cumulativo))'
            Items.Strings = (
              
                '01 - Opera'#231#227'o Tribut'#225'vel (base de c'#225'lculo = valor da opera'#231#227'o al' +
                #237'quota normal (cumulativo/n'#227'o cumulativo))'
              
                '02 - Opera'#231#227'o Tribut'#225'vel (base de c'#225'lculo = valor da opera'#231#227'o (a' +
                'l'#237'quota diferenciada))'
              
                '03 - Opera'#231#227'o Tribut'#225'vel (base de c'#225'lculo = quantidade vendida x' +
                ' al'#237'quota por unidade de produto)'
              '04 - Opera'#231#227'o Tribut'#225'vel (tributa'#231#227'o monof'#225'sica (al'#237'quota zero))'
              '05 - Opera'#231#227'o Tribut'#225'vel (Substitui'#231#227'o Tribut'#225'ria)'
              '06 - Opera'#231#227'o Tribut'#225'vel (al'#237'quota zero)'
              '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o'
              '08 - Opera'#231#227'o Sem Incid'#234'ncia da Contribui'#231#227'o'
              '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o'
              '49 - Outras Opera'#231#245'es de Sa'#237'da'
              
                '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                ' Receita Tributada no Mercado Interno'
              
                '51 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                ' Receita N'#227'o Tributada no Mercado Interno'
              
                '52 - Opera'#231#227'o com Direito a Cr'#233'dito '#8211' Vinculada Exclusivamente a' +
                ' Receita de Exporta'#231#227'o'
              
                '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                'tadas e N'#227'o-Tributadas no Mercado Interno'
              
                '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                'tadas no Mercado Interno e de Exporta'#231#227'o'
              
                '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'oTr' +
                'ibutadas no Mercado Interno e de Exporta'#231#227'o'
              '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas'
              'Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
              
                '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                'vamente a Receita Tributada no Mercado Interno'
              
                '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                'vamente a Receita N'#227'o-Tributada no Mercado Interno'
              
                '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                'vamente a Receita de Exporta'#231#227'o'
              
                '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
              
                '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
              
                '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
              
                '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
                #231#227'o'
              '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
              '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
              '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
              '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
              '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
              '74 - Opera'#231#227'o de Aquisi'#231#227'o; sem Incid'#234'ncia da Contribui'#231#227'o'
              '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
              '98 - Outras Opera'#231#245'es de Entrada'
              '99 - Outras Opera'#231#245'es')
          end
          object edtpPIS: TEdit
            Left = 113
            Top = 37
            Width = 121
            Height = 21
            TabOrder = 1
          end
        end
        object tsCOFINS: TTabSheet
          Caption = 'COFINS'
          ImageIndex = 4
          object lblCOFINSCST: TLabel
            Left = 88
            Top = 13
            Width = 19
            Height = 13
            Caption = 'CST'
          end
          object lblpCOFINS: TLabel
            Left = 46
            Top = 40
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Aliquota (%)'
          end
          object cbbCOFINSCST: TComboBox
            Left = 113
            Top = 10
            Width = 544
            Height = 21
            TabOrder = 0
            Text = 
              '01 - Opera'#231#227'o Tribut'#225'vel (base de c'#225'lculo = valor da opera'#231#227'o al' +
              #237'quota normal (cumulativo/n'#227'o cumulativo))'
            Items.Strings = (
              
                '01 - Opera'#231#227'o Tribut'#225'vel (base de c'#225'lculo = valor da opera'#231#227'o al' +
                #237'quota normal (cumulativo/n'#227'o cumulativo))'
              
                '02 - Opera'#231#227'o Tribut'#225'vel (base de c'#225'lculo = valor da opera'#231#227'o (a' +
                'l'#237'quota diferenciada))'
              
                '03 - Opera'#231#227'o Tribut'#225'vel (base de c'#225'lculo = quantidade vendida x' +
                ' al'#237'quota por unidade de produto)'
              '04 - Opera'#231#227'o Tribut'#225'vel (tributa'#231#227'o monof'#225'sica (al'#237'quota zero))'
              '05 - Opera'#231#227'o Tribut'#225'vel (Substitui'#231#227'o Tribut'#225'ria)'
              '06 - Opera'#231#227'o Tribut'#225'vel (al'#237'quota zero)'
              '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o'
              '08 - Opera'#231#227'o Sem Incid'#234'ncia da Contribui'#231#227'o'
              '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o'
              '49 - Outras Opera'#231#245'es de Sa'#237'da'
              
                '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                ' Receita Tributada no Mercado Interno'
              
                '51 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                ' Receita N'#227'o Tributada no Mercado Interno'
              
                '52 - Opera'#231#227'o com Direito a Cr'#233'dito '#8211' Vinculada Exclusivamente a' +
                ' Receita de Exporta'#231#227'o'
              
                '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                'tadas e N'#227'o-Tributadas no Mercado Interno'
              
                '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                'tadas no Mercado Interno e de Exporta'#231#227'o'
              
                '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'oTr' +
                'ibutadas no Mercado Interno e de Exporta'#231#227'o'
              '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas'
              'Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
              
                '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                'vamente a Receita Tributada no Mercado Interno'
              
                '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                'vamente a Receita N'#227'o-Tributada no Mercado Interno'
              
                '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                'vamente a Receita de Exporta'#231#227'o'
              
                '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
              
                '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
              
                '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
              
                '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
                #231#227'o'
              '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
              '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
              '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
              '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
              '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
              '74 - Opera'#231#227'o de Aquisi'#231#227'o; sem Incid'#234'ncia da Contribui'#231#227'o'
              '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
              '98 - Outras Opera'#231#245'es de Entrada'
              '99 - Outras Opera'#231#245'es')
          end
          object edtpCOFINS: TEdit
            Left = 113
            Top = 37
            Width = 121
            Height = 21
            TabOrder = 1
          end
        end
      end
    end
  end
  object btnAssinarXML: TButton
    Left = 222
    Top = 8
    Width = 103
    Height = 25
    Caption = 'Assinar XML'
    TabOrder = 6
    OnClick = btnAssinarXMLClick
  end
  object btnConsultarRecibo: TButton
    Left = 440
    Top = 8
    Width = 103
    Height = 25
    Caption = 'Consultar Recibo'
    TabOrder = 7
    OnClick = btnConsultarReciboClick
  end
end
