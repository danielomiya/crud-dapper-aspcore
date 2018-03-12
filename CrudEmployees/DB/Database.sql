CREATE DATABASE CrudEmployees;
GO

USE CrudEmployees;
GO

CREATE TABLE Employees (
  Id INTEGER NOT NULL IDENTITY,
  Name VARCHAR(100) NOT NULL,
  Address VARCHAR(200) NOT NULL,
  Phone VARCHAR(20) NOT NULL UNIQUE,
  Birthday DATE NOT NULL,
  Admission DATE NOT NULL DEFAULT GETDATE(),
  Rg VARCHAR(20) NOT NULL,
  Cpf CHAR(14) UNIQUE,
  RegistrationNumber VARCHAR(20) NOT NULL,
  Education VARCHAR(MAX) NOT NULL,
  PRIMARY KEY(id)
);
GO

PRINT('Banco de dados e tabela(s) criados.');
GO

INSERT INTO Employees(Name, Address, Phone, Birthday, Admission, Rg, Cpf, RegistrationNumber, Education) VALUES
/* 01 */ ('Mauro Amaral Teixeira', 'Rua Álvaro Anes, 749', '(11) 93995-8485', CONVERT(DATE, '09/06/1961', 101), GETDATE(), '4.957.254', '828.537.033-04', ABS(CHECKSUM(NEWID())), 'Doutorado em Mediciona pela USP.'),
/* 02 */ ('Alice Gomes Machado', 'Rua Álvaro Anes, 134', '(11) 93579-7212', CONVERT(DATE, '03/02/1980', 101), GETDATE(), '4.032.894-40', '873.514.472-68', ABS(CHECKSUM(NEWID())), 'Doutorado em Sistemas da Informação pela FIAP.'),
/* 03 */ ('Lucas Ducati Amaral', 'Praça Anita Garibaldi, 44', '(19) 97744-8735', CONVERT(DATE, '01/20/1973', 101), GETDATE(), '91.122.534-1', '171.396.929-71', ABS(CHECKSUM(NEWID())), 'Técnico em Edificações pela ETEC.'),
/* 04 */ ('Giovana Machado Teixeira', 'Travessa Ângelo Valler, 918', '(19) 92323-7394	', CONVERT(DATE, '09/20/1963', 101), GETDATE(), '2.977.269', '225.066.264-92', ABS(CHECKSUM(NEWID())), 'PhD em Antropologia pelo Mackenzie.'),
/* 05 */ ('Mariana Amaral Machado', 'Rua Anfibólios, 737', '(31) 93846-6527', CONVERT(DATE, '03/19/1987', 101), GETDATE(), '41.875.789-6', '848.051.868-52', ABS(CHECKSUM(NEWID())), 'Mestrado em Odontologia pela Uninove'),
/* 06 */ ('Henry Juan Iago Gomes', 'Quadra Quadra 7, 824', '(61) 3647-8506', CONVERT(DATE, '12/08/1996', 103), GETDATE(), '28.266.975-9', '891.314.842-04', ABS(CHECKSUM(NEWID())), 'Mestrado em Letras e Literatura pela Unicamp.'),
/* 07 */ ('Isabel Juliana Pietra da Rosa', 'Rua Prudente de Moraes, 212', '(54) 2948-8391', CONVERT(DATE, '15/03/1996', 103), GETDATE(), '31.041.066-6', '082.047.596-30', ABS(CHECKSUM(NEWID())), 'Pós-graduada em Psicologia.'),
/* 08 */ ('Bianca Sueli Yasmin da Mata', 'Rua Castro Alves, 984', '(41) 2712-8155', CONVERT(DATE, '24/07/1996', 103), GETDATE(), '25.150.351-3', '772.518.118-04', ABS(CHECKSUM(NEWID())), 'Técnico em Mectrônica.'),
/* 09 */ ('Yuri Manoel Paulo da Mota', 'Alameda Mary Tavares, 854', '(91) 3586-4046', CONVERT(DATE, '18/03/1996', 103), GETDATE(), '33.522.174-9', '386.821.130-66', ABS(CHECKSUM(NEWID())), 'Formado em Nutrição.'),
/* 10 */ ('Mateus Daniel Bryan da Silva', 'Conjunto Niterói, 299', '(84) 3906-9542', CONVERT(DATE, '02/05/1996', 103), GETDATE(), '20.940.710-4', '249.562.896-69', ABS(CHECKSUM(NEWID())), 'Engenheiro mecânico pela USP.'),
/* 11 */ ('Sérgio Felipe Duarte', 'Rua Projetada Dois, 867', '(98) 3908-5076', CONVERT(DATE, '08/11/1996', 103), GETDATE(), '13.546.390-7', '012.154.806-60', ABS(CHECKSUM(NEWID())), 'Pedagogo pela FMU.'),
/* 12 */ ('Liz Tatiane Maria Drumond', 'Rua Antônio Pinheiro Sampaio, 905', '(96) 2575-4584', CONVERT(DATE, '25/11/1996', 103), GETDATE(), '22.887.521-3', '446.828.594-04', ABS(CHECKSUM(NEWID())), 'Formada em Ciência da Computação pela Yale.'),
/* 13 */ ('Nair Mirella Sara Monteiro', 'Rua Diogo Alves da Silva, 985', '(49) 3702-1507', CONVERT(DATE, '23/09/1996', 103), GETDATE(), '41.552.344-8', '412.945.909-01', ABS(CHECKSUM(NEWID())), 'Pós-graduação em Direito Penal pela Harvard.'),
/* 14 */ ('Fátima Isabela Peixoto', 'Rua Vinte e Cinco, 344', '(31) 2842-6119', CONVERT(DATE, '17/08/1996', 103), GETDATE(), '28.639.253-7', '508.214.505-30', ABS(CHECKSUM(NEWID())), 'Secreatariado pela UNIP.'),
/* 15 */ ('Martin Oliver Barros', 'Rua Gabriel Henrique de Farias Júnior, 121', '(21) 3933-2371', CONVERT(DATE, '11/01/1996', 103), GETDATE(), '23.953.827-4', '869.007.559-33', ABS(CHECKSUM(NEWID())), 'Gastrônomo pelo Senac.'),
/* 16 */ ('Luiz Eduardo Luan Galvão', 'Avenida Américo Dantas de Assis, 217', '(83) 2824-2251', CONVERT(DATE, '24/09/1996', 103), GETDATE(), '24.694.825-5', '443.256.962-02', ABS(CHECKSUM(NEWID())), 'Mestrado em Hortelaria.'),
/* 17 */ ('Andrea Ester Elza Barros', 'Rua Doze, 205', '(91) 3869-1246', CONVERT(DATE, '07/07/1996', 103), GETDATE(), '30.154.173-5', '350.740.942-91', ABS(CHECKSUM(NEWID())), 'Formada em Moda pelo London College of Fashion.'),
/* 18 */ ('Elaine Heloisa Martins', 'Quadra 407 Sul Alameda 3, 109', '(63) 3709-6047', CONVERT(DATE, '09/09/1996', 103), GETDATE(), '44.096.508-1', '043.803.149-01', ABS(CHECKSUM(NEWID())), 'Analista e Desenvolvedora de Sistemas pela FATEC.'),
/* 19 */ ('Luan João Nunes', 'Rua Comerciante Conrado Jerônimo Leite, 865', '(83) 2594-0668', CONVERT(DATE, '11/10/1996', 103), GETDATE(), '14.835.615-1', '269.740.597-60', ABS(CHECKSUM(NEWID())), 'Bacharelado em Música pela FMCG.'),
/* 20 */ ('Ricardo Murilo Gonçalves', 'Rua Vilma Richter Martins, 738', '(19) 3974-3439', CONVERT(DATE, '13/11/1996', 103), GETDATE(), '27.319.496-3', '786.877.948-94', ABS(CHECKSUM(NEWID())), 'Arquiteto de dados pela FIAP.'),
/* 21 */ ('Igor Eduardo das Neves', 'Rua Olímpio Caragnatto, 234', '(49) 2886-0276', CONVERT(DATE, '23/07/1996', 103), GETDATE(), '22.765.346-4', '968.119.602-30', ABS(CHECKSUM(NEWID())), 'Técnico em Artes Gráficas pela ETEC.'),
/* 22 */ ('Bianca Nicole Santos', 'Rua Carlos Pinto de Lima, 745', '(41) 98856-3766', CONVERT(DATE, '24/09/1996', 103), GETDATE(), '32.710.464-8', '680.085.067-50', ABS(CHECKSUM(NEWID())), 'Técnico em Acessoria Jurídica pela ETEC.'),
/* 23 */ ('Sara Stefany Alícia da Cunha', 'Rua Paraguai, 850', '(69) 2934-0492', CONVERT(DATE, '04/03/1996', 103), GETDATE(), '38.472.273-8', '521.905.798-72', ABS(CHECKSUM(NEWID())), 'Formada em Psicanálise pela UFSP.'),
/* 24 */ ('Marli Giovana da Cruz', 'Rua Vasco da Gama, 893', '(31) 3539-6928', CONVERT(DATE, '25/01/1996', 103), GETDATE(), '16.168.977-2', '229.570.816-87', ABS(CHECKSUM(NEWID())), 'Arqueteta de Redes certificada pela Cisco.'),
/* 25 */ ('Paulo Thomas Benedito Fogaça', 'Rua Henrique de Aragão, 250', '(67) 2896-5386', CONVERT(DATE, '11/10/1996', 103), GETDATE(), '21.677.085-3', '305.213.267-96', ABS(CHECKSUM(NEWID())), 'Formado em Teologia.');
GO

PRINT('Dados para propósito de testes injetados.');
GO

PRINT('Fim de script.');
GO
