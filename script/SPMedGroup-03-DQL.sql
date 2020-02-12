CREATE DATABASE SPMedGroup;

USE SPMedGroup;

SELECT * FROM Clinica; 
SELECT * FROM TipoUsuario;
SELECT * FROM Especialidade;
SELECT * FROM Situacao;
SELECT * FROM Administrador;
SELECT * FROM Paciente;
SELECT * FROM Medico;
SELECT * FROM Consulta;
SELECT * FROM Endereco;


SELECT Paciente.NomePaciente, Paciente.CPF, Paciente.RG, Paciente.Data_Nascimento, Paciente.Telefone,	
		Paciente.Email, Consulta.DataHora,
		CASE 
			WHEN IdClinica = 5 THEN 'SPGroup'
		END AS IdClinica FROM Paciente
		INNER JOIN Consulta ON Consulta.IdPaciente = Paciente.IdPaciente

--Saulo 
SELECT Paciente.NomePaciente, Paciente.CPF, Paciente.RG, Paciente.Data_Nascimento, Paciente.Telefone,	
		Paciente.Email, Consulta.DataHora, Clinica.NomeClinica
		FROM Paciente
		INNER JOIN Consulta ON Consulta.IdPaciente = Paciente.IdPaciente
		INNER JOIN Clinica ON Consulta.IdClinica = Clinica.IdClinica

SELECT Paciente.NomePaciente, Paciente.CPF, Paciente.RG, Paciente.Data_Nascimento, Paciente.Telefone,	
		Paciente.Email, Consulta.DataHora, Medico.NomeMedico, Medico.CNPJ, Medico.CRM, Especialidade.TipoEspecialidade FROM Consulta
		INNER JOIN Paciente ON Paciente.IdPaciente = Consulta.IdPaciente
		INNER JOIN Medico ON Medico.IdMedico = Consulta.IdMedico
		INNER JOIN Especialidade ON Especialidade.IdEspecialidade = Medico.IdEspecialidade

SELECT Medico.NomeMedico, Medico.CNPJ, Medico.CRM, Especialidade.TipoEspecialidade FROM Especialidade
INNER JOIN Medico ON Especialidade.IdEspecialidade = Medico.IdEspecialidade

SELECT Medico.NomeMedico, Medico.IdEspecialidade, Medico.CNPJ, Medico.CRM, Clinica.NomeClinica FROM Medico
INNER JOIN Clinica ON Clinica.IdClinica = Medico.IdClinica

-- Quantidade de usuários após realizar a importação do banco de dados
SELECT COUNT (IdPaciente) FROM Paciente

SELECT CONVERT (VARCHAR, GETDATE(), 0)
SELECT CONVERT (VARCHAR, GETDATE(), 1)
SELECT CONVERT (VARCHAR, GETDATE(), 4)

--Idade Atual 
SELECT Usuario.NomeUsuario
      ,Usuario.Email
	  ,Usuario.Genero
	  ,TipoUsuario.TituloTipoUsuario 
	  ,DATEDIFF(YY, Usuario.DataNascimento, GETDATE()) -
		CASE
			WHEN DATEADD(YY, DATEDIFF(YY,Usuario.DataNascimento,GETDATE()),Usuario.DataNascimento) 
			> GETDATE() THEN 1
			ELSE 0
		END AS Idade
FROM
Usuario
INNER JOIN
TipoUsuario
ON TipoUsuario.IdTipoUsuario = Usuario.IdTipoUsuario