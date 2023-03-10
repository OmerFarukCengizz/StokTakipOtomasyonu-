USE [stok]
GO
/****** Object:  Table [dbo].[Firmalar]    Script Date: 4.02.2023 14:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firmalar](
	[Firma_ID] [int] IDENTITY(1,1) NOT NULL,
	[Firma_Ad] [nvarchar](50) NULL,
	[Firma_Alacak] [decimal](10, 2) NULL,
	[Firma_Verecek] [decimal](10, 2) NULL,
	[Firma_indirim] [int] NULL,
 CONSTRAINT [PK_Firmalar] PRIMARY KEY CLUSTERED 
(
	[Firma_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hesaplar]    Script Date: 4.02.2023 14:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hesaplar](
	[Hesap_ID] [int] NOT NULL,
	[Hesap_Ad] [nvarchar](50) NULL,
	[Bloke_Suresi] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kategoriler]    Script Date: 4.02.2023 14:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kategoriler](
	[Kategori_ID] [int] IDENTITY(1,1) NOT NULL,
	[Kategori_ad] [nvarchar](50) NULL,
 CONSTRAINT [PK_kategoriler] PRIMARY KEY CLUSTERED 
(
	[Kategori_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KDV]    Script Date: 4.02.2023 14:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KDV](
	[KDV_ID] [int] IDENTITY(1,1) NOT NULL,
	[KDV_oran] [int] NULL,
 CONSTRAINT [PK_KDV] PRIMARY KEY CLUSTERED 
(
	[KDV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 4.02.2023 14:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[Kullaniciadi] [nvarchar](50) NULL,
	[Sifre] [nvarchar](20) NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markalar]    Script Date: 4.02.2023 14:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markalar](
	[Marka_ID] [int] IDENTITY(1,1) NOT NULL,
	[Marka_Isim] [nvarchar](50) NULL,
 CONSTRAINT [PK_Markalar] PRIMARY KEY CLUSTERED 
(
	[Marka_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odemeler]    Script Date: 4.02.2023 14:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odemeler](
	[Odeme_ID] [int] IDENTITY(1,1) NOT NULL,
	[Firma_ID] [int] NOT NULL,
	[Odenen_tutar] [decimal](10, 2) NULL,
	[Odeme_kod] [nvarchar](3) NULL,
	[Odeme_tarih] [datetime] NULL,
 CONSTRAINT [PK_Odemeler] PRIMARY KEY CLUSTERED 
(
	[Odeme_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satis_Detay]    Script Date: 4.02.2023 14:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis_Detay](
	[Satis_ID] [int] IDENTITY(1,1) NOT NULL,
	[Firma_ID] [int] NULL,
	[Urun_ID] [int] NOT NULL,
	[Urun_adet] [int] NULL,
	[Birim_fiyat] [decimal](5, 2) NULL,
	[Tarih] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satislar]    Script Date: 4.02.2023 14:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satislar](
	[Satis_ID] [int] NOT NULL,
	[Firma_ID] [int] NULL,
	[Satis_Tutar] [decimal](5, 2) NULL,
	[Odenen_Tutar] [decimal](5, 2) NULL,
	[Odeme_Tipi] [nvarchar](3) NULL,
	[Tarih] [date] NULL,
 CONSTRAINT [PK_Satislar] PRIMARY KEY CLUSTERED 
(
	[Satis_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sepet]    Script Date: 4.02.2023 14:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sepet](
	[Sepet_ID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciID] [int] NOT NULL,
	[Urun_ID] [int] NOT NULL,
	[Urun_Miktar] [int] NULL,
	[KDVsiz_fiyat] [decimal](5, 2) NULL,
	[Toplam_fiyat] [decimal](5, 2) NULL,
	[Tarih] [datetime] NULL,
	[Firma_ID] [int] NOT NULL,
	[KDV_ID] [int] NULL,
 CONSTRAINT [PK_Sepet] PRIMARY KEY CLUSTERED 
(
	[Sepet_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparis_Detay]    Script Date: 4.02.2023 14:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparis_Detay](
	[Sepet_ID] [int] NOT NULL,
	[Siparis_ID] [int] NOT NULL,
	[KullaniciID] [int] NULL,
	[Urun_ID] [int] NOT NULL,
	[KDV_ID] [int] NULL,
	[Urun_adet] [int] NULL,
	[KDVsiz_fiyat] [decimal](5, 2) NULL,
	[Firma_ID] [int] NULL,
	[Tarih] [datetime] NULL,
 CONSTRAINT [PK_Siparis_Detay_1] PRIMARY KEY CLUSTERED 
(
	[Sepet_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparisler]    Script Date: 4.02.2023 14:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparisler](
	[Siparis_ID] [int] NOT NULL,
	[Firma_ID] [int] NULL,
	[Siparis_Tutar] [decimal](10, 2) NULL,
	[Odenen_Tutar] [decimal](6, 2) NULL,
	[Siparis_Tarih] [datetime] NULL,
 CONSTRAINT [PK_Siparisler] PRIMARY KEY CLUSTERED 
(
	[Siparis_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 4.02.2023 14:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[Urun_ID] [int] IDENTITY(1,1) NOT NULL,
	[Barkod_no] [int] NULL,
	[Urun_Ad] [nvarchar](60) NOT NULL,
	[Marka_ID] [int] NOT NULL,
	[Kategori_ID] [int] NOT NULL,
	[KDV_Haric_Fiyat] [decimal](5, 2) NOT NULL,
	[KDV_ID] [int] NOT NULL,
	[Yuzdelik_Kar] [decimal](5, 2) NOT NULL,
	[Iskonto] [int] NOT NULL,
	[Stok] [int] NOT NULL,
	[Firma_ID] [int] NOT NULL,
	[Resim] [nvarchar](max) NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[Urun_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Firmalar] ON 

INSERT [dbo].[Firmalar] ([Firma_ID], [Firma_Ad], [Firma_Alacak], [Firma_Verecek], [Firma_indirim]) VALUES (1, N'Mert Toptan Gıda A.Ş.', CAST(-243.98 AS Decimal(10, 2)), CAST(500.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Firmalar] ([Firma_ID], [Firma_Ad], [Firma_Alacak], [Firma_Verecek], [Firma_indirim]) VALUES (2, N'Doğan Perakende Gıda A.Ş.', CAST(123.61 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Firmalar] ([Firma_ID], [Firma_Ad], [Firma_Alacak], [Firma_Verecek], [Firma_indirim]) VALUES (3, N'Natüre Endüstriyel Temizlik Ürünleri', CAST(39.71 AS Decimal(10, 2)), CAST(4.04 AS Decimal(10, 2)), 0)
INSERT [dbo].[Firmalar] ([Firma_ID], [Firma_Ad], [Firma_Alacak], [Firma_Verecek], [Firma_indirim]) VALUES (4, N'Sek Fırın', CAST(36.72 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Firmalar] ([Firma_ID], [Firma_Ad], [Firma_Alacak], [Firma_Verecek], [Firma_indirim]) VALUES (5, N'Güven Kasap', CAST(403.43 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 0)
SET IDENTITY_INSERT [dbo].[Firmalar] OFF
GO
SET IDENTITY_INSERT [dbo].[kategoriler] ON 

INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (1, N'Kuru Gıda')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (2, N'Meyve Sebze')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (3, N'Şarküteri')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (4, N'Atıştırmalık')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (5, N'Fırın-Pasta')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (6, N'Kahvaltı')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (7, N'Yağlar ve Soslar')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (8, N'Kişisel bakım')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (9, N'İçecekler')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (10, N'Temizlik')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (11, N'Baharatlar')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (29, N'Elektronik')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (30, N'Oyuncak')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (31, N'Züccaciye')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (32, N'Kırtasiye')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (33, N'Donmuş gıdalar')
INSERT [dbo].[kategoriler] ([Kategori_ID], [Kategori_ad]) VALUES (34, N'Bebek')
SET IDENTITY_INSERT [dbo].[kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[KDV] ON 

INSERT [dbo].[KDV] ([KDV_ID], [KDV_oran]) VALUES (1, 1)
INSERT [dbo].[KDV] ([KDV_ID], [KDV_oran]) VALUES (2, 8)
INSERT [dbo].[KDV] ([KDV_ID], [KDV_oran]) VALUES (3, 18)
SET IDENTITY_INSERT [dbo].[KDV] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([KullaniciID], [Kullaniciadi], [Sifre]) VALUES (1, N'admin', N'admin123')
INSERT [dbo].[Kullanicilar] ([KullaniciID], [Kullaniciadi], [Sifre]) VALUES (2, N'omer', N'omer123')
INSERT [dbo].[Kullanicilar] ([KullaniciID], [Kullaniciadi], [Sifre]) VALUES (3, N'berkay', N'berkay123')
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[Markalar] ON 

INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (1, N'Ülker')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (2, N'Ankara')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (3, N'Lezita')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (4, N'Duru')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (5, N'Sütaş')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (6, N'Pınar')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (7, N'Axe')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (8, N'Omo')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (9, N'Doritos')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (10, N'Clear')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (11, N'Orkide')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (12, N'Eti')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (13, N'Selpak')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (14, N'Nestle')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (15, N'Kellogs')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (16, N'Torku')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (17, N'Fairy')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (18, N'Coca cola')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (19, N'Acar')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (20, N'Güven')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (21, N'Köylüm')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (22, N'Mis')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (27, N'Haribo')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (28, N'Duracell')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (29, N'Uludağ')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (30, N'Solo')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (31, N'Colgate')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (32, N'Şahin')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (33, N'Lipton')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (34, N'Vileda')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (35, N'Faber Castell')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (36, N'Koroplast')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (37, N'Algida')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (38, N'Knorr')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (39, N'Nescafe')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (40, N'Elseve')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (41, N'Dr. Oetker')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (42, N'Aptamil')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (43, N'Prima')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (44, N'Gıpta')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (45, N'Komili')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (46, N'Superfresh')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (47, N'Arko')
INSERT [dbo].[Markalar] ([Marka_ID], [Marka_Isim]) VALUES (48, N'Tat')
SET IDENTITY_INSERT [dbo].[Markalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Odemeler] ON 

INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (2, 3, CAST(127.00 AS Decimal(10, 2)), N'C', CAST(N'2022-05-19T13:14:41.000' AS DateTime))
INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (3, 4, CAST(344.00 AS Decimal(10, 2)), N'C', CAST(N'2022-06-21T14:43:11.000' AS DateTime))
INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (4, 2, CAST(256.00 AS Decimal(10, 2)), N'G', CAST(N'2022-06-27T10:33:22.000' AS DateTime))
INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (5, 1, CAST(820.00 AS Decimal(10, 2)), N'C', CAST(N'2022-07-03T18:52:35.000' AS DateTime))
INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (6, 5, CAST(439.00 AS Decimal(10, 2)), N'G', CAST(N'2022-07-14T09:24:00.000' AS DateTime))
INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (7, 2, CAST(308.00 AS Decimal(10, 2)), N'C', CAST(N'2022-07-18T16:02:47.000' AS DateTime))
INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (8, 4, CAST(518.00 AS Decimal(10, 2)), N'G', CAST(N'2022-07-29T17:35:05.000' AS DateTime))
INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (9, 1, CAST(406.00 AS Decimal(10, 2)), N'C', CAST(N'2022-08-08T14:58:00.000' AS DateTime))
INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (10, 3, CAST(722.00 AS Decimal(10, 2)), N'G', CAST(N'2022-08-19T11:11:11.000' AS DateTime))
INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (11, 5, CAST(100.00 AS Decimal(10, 2)), N'G', CAST(N'2022-11-08T11:07:51.637' AS DateTime))
INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (12, 1, CAST(272.00 AS Decimal(10, 2)), N'C', CAST(N'2022-05-07T13:14:00.000' AS DateTime))
INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (1011, 1, CAST(500.00 AS Decimal(10, 2)), N'C', CAST(N'2022-11-08T13:01:51.993' AS DateTime))
INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (1012, 1, CAST(500.00 AS Decimal(10, 2)), N'G', CAST(N'2022-11-08T13:02:41.223' AS DateTime))
INSERT [dbo].[Odemeler] ([Odeme_ID], [Firma_ID], [Odenen_tutar], [Odeme_kod], [Odeme_tarih]) VALUES (1013, 1, CAST(500.00 AS Decimal(10, 2)), N'G', CAST(N'2022-11-08T13:16:48.557' AS DateTime))
SET IDENTITY_INSERT [dbo].[Odemeler] OFF
GO
INSERT [dbo].[Satislar] ([Satis_ID], [Firma_ID], [Satis_Tutar], [Odenen_Tutar], [Odeme_Tipi], [Tarih]) VALUES (1, 3, CAST(4.04 AS Decimal(5, 2)), NULL, NULL, CAST(N'2022-11-09' AS Date))
GO
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (17, 1161302007, 1, 8, 3, 1, CAST(2.50 AS Decimal(5, 2)), 1, CAST(N'2022-12-24T20:33:02.630' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (18, 1161302007, 1, 6, 2, 1, CAST(15.65 AS Decimal(5, 2)), 1, CAST(N'2022-12-24T20:33:02.637' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (19, 1161302007, 1, 18, 1, 1, CAST(20.10 AS Decimal(5, 2)), 1, CAST(N'2022-12-24T20:33:02.637' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (20, 1831862823, 1, 16, 1, 1, CAST(2.15 AS Decimal(5, 2)), 2, CAST(N'2022-12-24T20:36:00.873' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (21, 1831862823, 1, 12, 2, 1, CAST(7.85 AS Decimal(5, 2)), 2, CAST(N'2022-12-24T20:36:00.877' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (22, 1831862823, 1, 25, 2, 1, CAST(6.50 AS Decimal(5, 2)), 2, CAST(N'2022-12-24T20:36:00.877' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (23, 294442869, 1, 9, 2, 2, CAST(48.70 AS Decimal(5, 2)), 5, CAST(N'2022-12-24T20:41:46.247' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (24, 294442869, 1, 30, 2, 1, CAST(38.85 AS Decimal(5, 2)), 5, CAST(N'2022-12-24T20:41:46.247' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (25, 294442869, 1, 31, 2, 1, CAST(118.55 AS Decimal(5, 2)), 5, CAST(N'2022-12-24T20:41:46.247' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (26, 294442869, 1, 3, 2, 1, CAST(118.75 AS Decimal(5, 2)), 5, CAST(N'2022-12-24T20:41:46.247' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (27, 1290035328, 1, 14, 3, 1, CAST(9.45 AS Decimal(5, 2)), 3, CAST(N'2022-12-24T21:07:21.490' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (28, 1290035328, 1, 13, 3, 1, CAST(24.20 AS Decimal(5, 2)), 3, CAST(N'2022-12-24T21:07:21.490' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (29, 1016758430, 1, 23, 2, 5, CAST(3.40 AS Decimal(5, 2)), 4, CAST(N'2022-12-24T21:14:07.513' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (30, 1311529984, 1, 23, 2, 5, CAST(3.40 AS Decimal(5, 2)), 4, CAST(N'2022-12-24T21:16:31.423' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (31, 1685794175, 1, 48, 2, 1, CAST(30.60 AS Decimal(5, 2)), 2, CAST(N'2022-12-24T22:41:26.143' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (32, 1685794175, 1, 64, 2, 1, CAST(8.65 AS Decimal(5, 2)), 2, CAST(N'2022-12-24T22:41:26.180' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (33, 1685794175, 1, 52, 2, 2, CAST(8.65 AS Decimal(5, 2)), 2, CAST(N'2022-12-24T22:41:26.180' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (34, 1685794175, 1, 53, 2, 1, CAST(13.75 AS Decimal(5, 2)), 2, CAST(N'2022-12-24T22:41:26.183' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (35, 1685794175, 1, 33, 2, 2, CAST(13.90 AS Decimal(5, 2)), 2, CAST(N'2022-12-24T22:41:26.183' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (36, 1483508579, 1, 18, 1, 1, CAST(20.10 AS Decimal(5, 2)), 1, CAST(N'2022-12-24T22:43:28.623' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (39, 1488547549, 1, 44, 2, 1, CAST(29.75 AS Decimal(5, 2)), 1, CAST(N'2022-12-24T22:51:19.023' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (40, 1488547549, 1, 43, 3, 1, CAST(6.90 AS Decimal(5, 2)), 1, CAST(N'2022-12-24T22:51:19.023' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (1018, 62245758, 1, 55, 2, 1, CAST(100.20 AS Decimal(5, 2)), 1, CAST(N'2022-12-27T19:17:15.437' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (1019, 62245758, 1, 59, 2, 2, CAST(6.45 AS Decimal(5, 2)), 1, CAST(N'2022-12-27T19:17:15.440' AS DateTime))
INSERT [dbo].[Siparis_Detay] ([Sepet_ID], [Siparis_ID], [KullaniciID], [Urun_ID], [KDV_ID], [Urun_adet], [KDVsiz_fiyat], [Firma_ID], [Tarih]) VALUES (1020, 1228860568, 1, 11, 2, 1, CAST(16.20 AS Decimal(5, 2)), 1, CAST(N'2022-12-29T13:20:53.673' AS DateTime))
GO
INSERT [dbo].[Siparisler] ([Siparis_ID], [Firma_ID], [Siparis_Tutar], [Odenen_Tutar], [Siparis_Tarih]) VALUES (62245758, 1, CAST(122.15 AS Decimal(10, 2)), NULL, CAST(N'2022-12-27T19:17:15.437' AS DateTime))
INSERT [dbo].[Siparisler] ([Siparis_ID], [Firma_ID], [Siparis_Tutar], [Odenen_Tutar], [Siparis_Tarih]) VALUES (294442869, 5, CAST(403.43 AS Decimal(10, 2)), NULL, CAST(N'2022-12-24T20:41:46.247' AS DateTime))
INSERT [dbo].[Siparisler] ([Siparis_ID], [Firma_ID], [Siparis_Tutar], [Odenen_Tutar], [Siparis_Tarih]) VALUES (1016758430, 4, CAST(18.36 AS Decimal(10, 2)), NULL, CAST(N'2022-12-24T21:14:07.513' AS DateTime))
INSERT [dbo].[Siparisler] ([Siparis_ID], [Firma_ID], [Siparis_Tutar], [Odenen_Tutar], [Siparis_Tarih]) VALUES (1161302007, 1, CAST(40.15 AS Decimal(10, 2)), NULL, CAST(N'2022-12-24T20:33:02.637' AS DateTime))
INSERT [dbo].[Siparisler] ([Siparis_ID], [Firma_ID], [Siparis_Tutar], [Odenen_Tutar], [Siparis_Tarih]) VALUES (1228860568, 1, CAST(17.50 AS Decimal(10, 2)), NULL, CAST(N'2022-12-29T13:20:53.673' AS DateTime))
INSERT [dbo].[Siparisler] ([Siparis_ID], [Firma_ID], [Siparis_Tutar], [Odenen_Tutar], [Siparis_Tarih]) VALUES (1290035328, 3, CAST(39.71 AS Decimal(10, 2)), NULL, CAST(N'2022-12-24T21:07:21.490' AS DateTime))
INSERT [dbo].[Siparisler] ([Siparis_ID], [Firma_ID], [Siparis_Tutar], [Odenen_Tutar], [Siparis_Tarih]) VALUES (1311529984, 4, CAST(18.36 AS Decimal(10, 2)), NULL, CAST(N'2022-12-24T21:16:31.423' AS DateTime))
INSERT [dbo].[Siparisler] ([Siparis_ID], [Firma_ID], [Siparis_Tutar], [Odenen_Tutar], [Siparis_Tarih]) VALUES (1483508579, 1, CAST(20.30 AS Decimal(10, 2)), NULL, CAST(N'2022-12-24T22:43:28.623' AS DateTime))
INSERT [dbo].[Siparisler] ([Siparis_ID], [Firma_ID], [Siparis_Tutar], [Odenen_Tutar], [Siparis_Tarih]) VALUES (1488547549, 1, CAST(40.27 AS Decimal(10, 2)), NULL, CAST(N'2022-12-24T22:51:19.023' AS DateTime))
INSERT [dbo].[Siparisler] ([Siparis_ID], [Firma_ID], [Siparis_Tutar], [Odenen_Tutar], [Siparis_Tarih]) VALUES (1685794175, 2, CAST(105.94 AS Decimal(10, 2)), NULL, CAST(N'2022-12-24T22:41:26.143' AS DateTime))
INSERT [dbo].[Siparisler] ([Siparis_ID], [Firma_ID], [Siparis_Tutar], [Odenen_Tutar], [Siparis_Tarih]) VALUES (1831862823, 2, CAST(17.67 AS Decimal(10, 2)), NULL, CAST(N'2022-12-24T20:36:00.877' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (1, 21785819, N'Ülker çikolatalı gofret 45 gr', 1, 4, CAST(2.30 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 15, 19, 1, N'https://ayb.akinoncdn.com/products/2019/05/31/22981/a4859bba-c613-49b3-b2f4-3238620e7009_size780x780_quality60_cropCenter.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (2, 32598583, N'Ekmek 225 gr', 19, 5, CAST(3.20 AS Decimal(5, 2)), 1, CAST(25.00 AS Decimal(5, 2)), 0, 45, 4, N'https://images.migrosone.com/sanalmarket/product/05120000/05120000-a957e2-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (3, 93829475, N'Dana kuşbaşı et 1 kg', 20, 3, CAST(118.75 AS Decimal(5, 2)), 2, CAST(37.50 AS Decimal(5, 2)), 0, 6, 5, N'https://www.mismarsanalmarket.com/UserFiles/Fotograflar/4049-dana-kusbasi-et-dana-kusbasi-et-dana-kusbasi.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (4, 35563145, N'Clear şampuan 450 ml', 10, 8, CAST(38.55 AS Decimal(5, 2)), 3, CAST(48.00 AS Decimal(5, 2)), 0, 4, 3, N'https://cdn.cimri.io/image/1200x1200/clearampuanvesakremifiyatlar_230121324.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (5, 45835415, N'Ankara makarna 500 gr', 2, 1, CAST(8.20 AS Decimal(5, 2)), 1, CAST(33.00 AS Decimal(5, 2)), 10, 12, 2, N'https://cdn.dsmcdn.com/ty56/product/media/images/20210118/23/54987495/61564639/1/1_org_zoom.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (6, 53268445, N'Pınar Süt 1 lt', 6, 6, CAST(15.65 AS Decimal(5, 2)), 2, CAST(35.00 AS Decimal(5, 2)), 0, 21, 1, N'https://images.migrosone.com/sanalmarket/product/11010010/11010010-1ae231-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (7, 24758563, N'Sütaş peynir 1 kg', 5, 6, CAST(46.45 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 0, 11, 2, N'https://st.myideasoft.com/idea/if/83/myassets/products/164/sm-urun-gorselleri-peynirler-320500-beyaz-peynir-1000g.jpg?revision=1638259326')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (8, 11258964, N'Selpak peçete', 13, 10, CAST(2.50 AS Decimal(5, 2)), 3, CAST(45.00 AS Decimal(5, 2)), 0, 22, 1, N'https://images.migrosone.com/sanalmarket/product/31040016/31040016-5cc088-1650x1650.png')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (9, 35423781, N'Lezita tavuk piliç 1 kg', 3, 3, CAST(48.70 AS Decimal(5, 2)), 2, CAST(35.00 AS Decimal(5, 2)), 0, 10, 5, N'https://reimg-carrefour.mncdn.com/mnresize/600/600/productimage/30064212/30064212_0_MC/8796719939634_1577687878439.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (10, 25368940, N' Axe deodorant 150 ml', 7, 8, CAST(27.35 AS Decimal(5, 2)), 3, CAST(47.00 AS Decimal(5, 2)), 0, 15, 3, N'https://img-morhipo.mncdn.com/mnresize/1200/1645/productimages/ii/8690637981531/[img][5][1].jpg?1028')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (11, 75648957, N'Coca cola 2.5 lt', 18, 9, CAST(16.20 AS Decimal(5, 2)), 2, CAST(45.00 AS Decimal(5, 2)), 15, 27, 1, N'https://ayb.akinoncdn.com/products/2019/01/22/3539/d365ffae-7e3f-4bc1-b5b4-c7a2c5569002_size780x780_quality60_cropCenter.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (12, 47899832, N'Doritos baharatlı cips 150gr', 9, 4, CAST(7.85 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 10, 18, 2, N'https://images.migrosone.com/sanalmarket/product/05081221/05081221-9c95c3-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (13, 87922654, N'Omo çamaşır deterjanı 1 kg', 8, 10, CAST(24.20 AS Decimal(5, 2)), 3, CAST(35.00 AS Decimal(5, 2)), 0, 1, 3, N'https://ayb.akinoncdn.com/products/2021/07/01/39700/cdccc608-ffb4-46e2-919b-c6f8743b7ecd_size780x780_quality60_cropCenter.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (14, 47832568, N'Fairy bulaşık deterjanı 1.5 lt', 17, 10, CAST(9.45 AS Decimal(5, 2)), 3, CAST(35.00 AS Decimal(5, 2)), 10, 15, 3, N'https://ayb.akinoncdn.com/products/2019/11/29/26854/f34a337e-8ee3-44c5-b7fa-04f2b2e13bb7_size780x780_quality60_cropCenter.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (15, 25487967, N'Torku banada çikolata 850 gr', 16, 6, CAST(40.60 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 0, 8, 2, N'https://cdn.dsmcdn.com/ty32/product/media/images/20201211/4/37408615/21805776/1/1_org_zoom.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (16, 84722329, N'Nestle su 0.5 lt', 14, 9, CAST(2.15 AS Decimal(5, 2)), 1, CAST(30.00 AS Decimal(5, 2)), 0, 38, 2, N'https://images.migrosone.com/sanalmarket/product/08061654/nestle-pure-life-su-0-5-l-40473b-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (17, 24638745, N'Kellogs mısır gevreği 350 gr', 15, 4, CAST(18.80 AS Decimal(5, 2)), 2, CAST(43.00 AS Decimal(5, 2)), 0, 5, 2, N'https://productimages.hepsiburada.net/s/80/1500/110000023015479.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (18, 30968744, N'Duru baldo pirinç 1 kg', 4, 1, CAST(20.10 AS Decimal(5, 2)), 1, CAST(30.00 AS Decimal(5, 2)), 0, 8, 1, N'https://productimages.hepsiburada.net/s/23/500/10051062693938.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (19, 63295741, N'Orkide ayçiçek yağı 2 lt', 11, 7, CAST(54.95 AS Decimal(5, 2)), 2, CAST(35.00 AS Decimal(5, 2)), 0, 3, 2, N'https://images.migrosone.com/sanalmarket/product/4113020/4113020-daeca2-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (20, 54215947, N'Eti puf 20 gr', 12, 4, CAST(1.95 AS Decimal(5, 2)), 2, CAST(33.00 AS Decimal(5, 2)), 15, 23, 1, N'https://www.mismarsanalmarket.com/UserFiles/Fotograflar/org/684-86920124-jpg-86920124.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (21, 78765020, N'Domates 1 kg', 21, 2, CAST(9.15 AS Decimal(5, 2)), 2, CAST(37.00 AS Decimal(5, 2)), 0, 10, 1, N'https://images.migrosone.com/sanalmarket/product/28080000/domates-kg-c7462d-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (23, NULL, N'Simit adet', 19, 5, CAST(3.40 AS Decimal(5, 2)), 2, CAST(34.00 AS Decimal(5, 2)), 0, 30, 4, N'https://images.migrosone.com/sanalmarket/product/05120101/05120101-b0b92d-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (24, NULL, N'Poğaça adet', 19, 5, CAST(3.40 AS Decimal(5, 2)), 2, CAST(34.00 AS Decimal(5, 2)), 0, 15, 4, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS64FH-ACPLEJ1bziijyed_d1Mjz0hbS337bl8LZ19H_OkeBiDnMzT0pcFL60VqthZRNL8&usqp=CAU')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (25, NULL, N'Elma 1 kg', 21, 2, CAST(6.50 AS Decimal(5, 2)), 2, CAST(38.00 AS Decimal(5, 2)), 0, 6, 2, N'https://esenlik.com.tr/star-elma-p-2246.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (26, NULL, N'Salatalık 1 kg', 21, 2, CAST(7.25 AS Decimal(5, 2)), 2, CAST(38.00 AS Decimal(5, 2)), 0, 9, 2, N'https://esenlik.com.tr//images/prod/2223.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (27, NULL, N'Muz 1 kg', 21, 2, CAST(13.75 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 0, 16, 1, N'http://www.cagri.com/Uploads/UrunResimleri/buyuk/muz-yerli-kg-4498-8.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (28, NULL, N'Çilek 1 kg', 21, 2, CAST(10.65 AS Decimal(5, 2)), 2, CAST(42.00 AS Decimal(5, 2)), 0, 6, 2, N'https://images.migrosone.com/sanalmarket/product/27081000/27081000-7e292e-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (29, NULL, N'Lezita Tüm Tavuk 1 kg', 3, 3, CAST(27.00 AS Decimal(5, 2)), 2, CAST(43.00 AS Decimal(5, 2)), 0, 8, 2, N'https://reimg-carrefour.mncdn.com/mnresize/600/600/productimage/30064212/30064212_0_MC/8796719939634_1577687878439.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (30, NULL, N'Lezita tavuk kanat 1 kg', 3, 3, CAST(38.85 AS Decimal(5, 2)), 2, CAST(38.00 AS Decimal(5, 2)), 0, 5, 5, N'https://reimg-carrefour.mncdn.com/mnresize/600/600/productimage/30064219/30064219_0_MC/8796720070706_1577687879187.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (31, NULL, N'Dana bonfile 1 kg', 20, 3, CAST(118.55 AS Decimal(5, 2)), 2, CAST(36.00 AS Decimal(5, 2)), 0, 4, 5, N'https://www.enflasyon.co/productimage/5fa0b1bf5c06e.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (32, NULL, N'Faber castell 0.7 uçlu kalem', 35, 32, CAST(9.35 AS Decimal(5, 2)), 2, CAST(47.00 AS Decimal(5, 2)), 0, 15, 2, N'https://cdn.dsmcdn.com/mnresize/500/-/ty10/product/media/images/20200820/15/8477163/82158708/0/0_org.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (33, NULL, N'Faber castell 72 sayfa çizgili defter', 35, 32, CAST(13.90 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 0, 10, 2, N'https://cdn.cimri.io/image/1200x1200/fabercastellspirallidefterfiyatlar_634365322.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (34, NULL, N'Faber castell silgi', 35, 32, CAST(7.20 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 0, 7, 1, N'https://platincdn.com/2316/pictures/IECNGXNOOA2282017181842_0000033181-900x900-product_popup.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (35, NULL, N'Elseve 450 ml şampuan', 40, 8, CAST(36.85 AS Decimal(5, 2)), 2, CAST(46.00 AS Decimal(5, 2)), 0, 9, 3, N'https://cdn.dsmcdn.com/mnresize/500/-/ty1/product/media/images/20200415/14/1883371/68740258/1/1_org.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (36, NULL, N'Arko men tıraş köpüğü', 47, 8, CAST(20.80 AS Decimal(5, 2)), 2, CAST(31.00 AS Decimal(5, 2)), 0, 5, 3, N'https://images.migrosone.com/sanalmarket/product/34110102/arko-tiras-kopugu-cool-200-ml-a8d3e6-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (38, NULL, N'Arko men 3 başlıklı tıraş bıçağı 5 li', 47, 8, CAST(34.00 AS Decimal(5, 2)), 2, CAST(37.00 AS Decimal(5, 2)), 0, 12, 3, N'https://productimages.hepsiburada.net/s/19/375/9856074711090.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (39, NULL, N'Arko el kremi', 47, 8, CAST(6.55 AS Decimal(5, 2)), 2, CAST(30.00 AS Decimal(5, 2)), 0, 3, 3, N'https://productimages.hepsiburada.net/s/23/375/9992397357106.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (40, NULL, N'Gıpta 120 yapraklı kareli defter', 44, 32, CAST(21.35 AS Decimal(5, 2)), 3, CAST(45.00 AS Decimal(5, 2)), 0, 8, 1, N'https://m.media-amazon.com/images/I/518bbTqXP8S.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (41, NULL, N'Tat 500 gr domates salçası', 48, 7, CAST(32.40 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 0, 8, 1, N'https://images.migrosone.com/sanalmarket/product/09010009/09010009-e7a595-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (42, NULL, N'Duracell kalem pil 2 li', 28, 29, CAST(9.00 AS Decimal(5, 2)), 3, CAST(28.00 AS Decimal(5, 2)), 0, 7, 1, N'https://productimages.hepsiburada.net/s/40/375/10659776364594.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (43, NULL, N'Duracell ince pil 2 li', 28, 29, CAST(6.90 AS Decimal(5, 2)), 3, CAST(30.00 AS Decimal(5, 2)), 0, 10, 1, N'https://cdnsta.avansas.com/mnresize/300/-/urun/58861/duracell-alkalin-aaa-ince-kalem-pil-2-li-paket-zoom-1.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (44, NULL, N'Komili 1 lt zeytinyağı', 45, 1, CAST(29.75 AS Decimal(5, 2)), 2, CAST(38.00 AS Decimal(5, 2)), 0, 6, 1, N'https://cdn.dsmcdn.com/ty339/product/media/images/20220223/16/57416739/21197562/2/2_org_zoom.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (45, NULL, N'Komili vanilyalı sıvı sabun', 45, 10, CAST(16.75 AS Decimal(5, 2)), 2, CAST(43.00 AS Decimal(5, 2)), 0, 9, 3, N'https://productimages.hepsiburada.net/s/1/375/9495684350002.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (46, NULL, N'Superfresh 4 lü pizza', 46, 33, CAST(46.30 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 0, 5, 2, N'https://images.migrosone.com/sanalmarket/product/17555643/17555643-99e61a-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (47, NULL, N'Superfresh patates kızartması 1 kg', 46, 33, CAST(20.00 AS Decimal(5, 2)), 2, CAST(35.00 AS Decimal(5, 2)), 0, 10, 1, N'https://images.migrosone.com/sanalmarket/product/17011040/17011040-3e510f-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (48, NULL, N'Superfresh hazır mantı', 46, 33, CAST(30.60 AS Decimal(5, 2)), 2, CAST(28.00 AS Decimal(5, 2)), 0, 4, 2, N'https://images.migrosone.com/sanalmarket/product/17555941/17555941-ab4caa-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (49, NULL, N'Prima 20 li bebek bezi', 43, 34, CAST(132.55 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 0, 6, 2, N'https://www.civilim.com/ProductImages/369092/big/8001841588537.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (50, NULL, N'Aptamil bebek maması 1 kg', 42, 34, CAST(82.40 AS Decimal(5, 2)), 2, CAST(45.00 AS Decimal(5, 2)), 0, 7, 1, N'https://cdn.cimri.io/image/1200x1200/aptamilbebekmamalarfiyatlar_358664972.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (51, NULL, N'Nescafe sütlü köpüklü adet', 39, 9, CAST(1.65 AS Decimal(5, 2)), 2, CAST(46.00 AS Decimal(5, 2)), 0, 20, 1, N'https://images.migrosone.com/sanalmarket/product/3222621/3222621-d180af-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (52, NULL, N'Nescafe xpresso soğuk kahve 330 ml', 39, 9, CAST(8.65 AS Decimal(5, 2)), 2, CAST(48.00 AS Decimal(5, 2)), 0, 11, 2, N'https://images.migrosone.com/hemen/product/08059620/08059620-3f79fe-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (53, NULL, N'Uludağ limonlu soda 6 lı', 29, 9, CAST(13.75 AS Decimal(5, 2)), 2, CAST(38.00 AS Decimal(5, 2)), 0, 3, 2, N'https://images.migrosone.com/sanalmarket/product/08040676/08040676-5a88ed.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (54, NULL, N'Uludağ gazoz 1 lt', 29, 9, CAST(8.95 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 0, 8, 2, N'https://images.migrosone.com/sanalmarket/product/08035150/08035150-10e9ce-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (55, NULL, N'Şahin kangal sucuk 1 kg', 32, 3, CAST(100.20 AS Decimal(5, 2)), 2, CAST(43.00 AS Decimal(5, 2)), 0, 9, 1, N'https://images.migrosone.com/sanalmarket/product/14209106/sahin-kangal-sucuk-kg-dcb3db.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (56, NULL, N'Algida 6 lı magnum doldurma', 37, 4, CAST(42.30 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 0, 4, 1, N'https://www.akbalmarket.com/pub/media/catalog/product/cache/cf8401c81eb7548299ffa17da48d3e9d/1/0/109351af-3434-41ce-816d-b2958ebc4c0e.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (57, NULL, N'Algida twister dondurma', 37, 4, CAST(3.85 AS Decimal(5, 2)), 2, CAST(35.00 AS Decimal(5, 2)), 0, 8, 2, N'https://www.algida.com.tr/content/dam/unilever/heart/turkey/pack_shot/twister_2d_ocean_packshot_2021_5000x5000px_-34784760-png.png')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (58, NULL, N'Algida buzparmak dondurma', 37, 4, CAST(2.50 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 0, 6, 2, N'https://www.algida.com.tr/content/dam/unilever/heart/turkey/pack_shot/max_buzparmak_packshot_2021_5000x5000px_-34784535-png.png')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (59, NULL, N'Haribo altın ayıcık jelibon', 27, 4, CAST(6.45 AS Decimal(5, 2)), 2, CAST(48.00 AS Decimal(5, 2)), 0, 10, 1, N'https://images.migrosone.com/sanalmarket/product/07110276/07110276-9fef91-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (60, NULL, N'Koroplast 10 lu çöp poşeti', 36, 10, CAST(11.25 AS Decimal(5, 2)), 2, CAST(40.00 AS Decimal(5, 2)), 0, 5, 3, N'https://reimg-carrefour.mncdn.com/mnresize/600/600/productimage/30248044/30248044_0_MC/8815559999538_1570881340965.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (61, NULL, N'Koroplast 20 li buzdolabı poşeti', 36, 10, CAST(16.55 AS Decimal(5, 2)), 2, CAST(38.00 AS Decimal(5, 2)), 0, 10, 3, N'https://images.migrosone.com/sanalmarket/product/32095002/koroplast-buzdolabi-poseti-orta-boy-569c81-1650x1650.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (62, NULL, N'Knorr hazır mercimek çorbası', 38, 1, CAST(4.25 AS Decimal(5, 2)), 2, CAST(50.00 AS Decimal(5, 2)), 0, 12, 1, N'https://productimages.hepsiburada.net/s/32/500/10352496410674.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (63, NULL, N'Knorr şehriyeli-tavuklu hazır çorba', 38, 1, CAST(5.10 AS Decimal(5, 2)), 2, CAST(48.00 AS Decimal(5, 2)), 0, 10, 2, N'https://cdn.akakce.com/knorr/knorr-sehriyeli-tavuk-51-gr-z.jpg')
INSERT [dbo].[Urunler] ([Urun_ID], [Barkod_no], [Urun_Ad], [Marka_ID], [Kategori_ID], [KDV_Haric_Fiyat], [KDV_ID], [Yuzdelik_Kar], [Iskonto], [Stok], [Firma_ID], [Resim]) VALUES (64, NULL, N'Dr.oetker çikolatalı puding', 41, 5, CAST(8.65 AS Decimal(5, 2)), 2, CAST(36.00 AS Decimal(5, 2)), 0, 8, 2, N'https://images.migrosone.com/sanalmarket/product/07100021/07100021-245aee.jpg')
SET IDENTITY_INSERT [dbo].[Urunler] OFF
GO
ALTER TABLE [dbo].[Sepet]  WITH CHECK ADD  CONSTRAINT [FK_Sepet_Firmalar] FOREIGN KEY([Firma_ID])
REFERENCES [dbo].[Firmalar] ([Firma_ID])
GO
ALTER TABLE [dbo].[Sepet] CHECK CONSTRAINT [FK_Sepet_Firmalar]
GO
ALTER TABLE [dbo].[Sepet]  WITH CHECK ADD  CONSTRAINT [FK_Sepet_KDV] FOREIGN KEY([KDV_ID])
REFERENCES [dbo].[KDV] ([KDV_ID])
GO
ALTER TABLE [dbo].[Sepet] CHECK CONSTRAINT [FK_Sepet_KDV]
GO
ALTER TABLE [dbo].[Sepet]  WITH CHECK ADD  CONSTRAINT [FK_Sepet_Kullanicilar] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[Sepet] CHECK CONSTRAINT [FK_Sepet_Kullanicilar]
GO
ALTER TABLE [dbo].[Sepet]  WITH CHECK ADD  CONSTRAINT [FK_Sepet_Urunler] FOREIGN KEY([Urun_ID])
REFERENCES [dbo].[Urunler] ([Urun_ID])
GO
ALTER TABLE [dbo].[Sepet] CHECK CONSTRAINT [FK_Sepet_Urunler]
GO
ALTER TABLE [dbo].[Siparis_Detay]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Detay_Firmalar] FOREIGN KEY([Firma_ID])
REFERENCES [dbo].[Firmalar] ([Firma_ID])
GO
ALTER TABLE [dbo].[Siparis_Detay] CHECK CONSTRAINT [FK_Siparis_Detay_Firmalar]
GO
ALTER TABLE [dbo].[Siparis_Detay]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Detay_KDV] FOREIGN KEY([KDV_ID])
REFERENCES [dbo].[KDV] ([KDV_ID])
GO
ALTER TABLE [dbo].[Siparis_Detay] CHECK CONSTRAINT [FK_Siparis_Detay_KDV]
GO
ALTER TABLE [dbo].[Siparis_Detay]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Detay_Kullanicilar] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[Siparis_Detay] CHECK CONSTRAINT [FK_Siparis_Detay_Kullanicilar]
GO
ALTER TABLE [dbo].[Siparis_Detay]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Detay_Urunler] FOREIGN KEY([Urun_ID])
REFERENCES [dbo].[Urunler] ([Urun_ID])
GO
ALTER TABLE [dbo].[Siparis_Detay] CHECK CONSTRAINT [FK_Siparis_Detay_Urunler]
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_Siparisler_Firmalar] FOREIGN KEY([Firma_ID])
REFERENCES [dbo].[Firmalar] ([Firma_ID])
GO
ALTER TABLE [dbo].[Siparisler] CHECK CONSTRAINT [FK_Siparisler_Firmalar]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Firmalar] FOREIGN KEY([Firma_ID])
REFERENCES [dbo].[Firmalar] ([Firma_ID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Firmalar]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_kategoriler] FOREIGN KEY([Kategori_ID])
REFERENCES [dbo].[kategoriler] ([Kategori_ID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_kategoriler]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_KDV] FOREIGN KEY([KDV_ID])
REFERENCES [dbo].[KDV] ([KDV_ID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_KDV]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Markalar] FOREIGN KEY([Marka_ID])
REFERENCES [dbo].[Markalar] ([Marka_ID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Markalar]
GO
