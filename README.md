<h1 align='center'>Banco de Dados (MySQL)</h1>
<h2 align='center'>Empresa Momento</h2>
<p>
A Momento é uma empresa única que faz o melhor que pode para alcançar o melhor da humanidade. 
</p><br>


**🔹1. Inclua suas próprias informações no departamento de tecnologia da empresa.**

>insert into funcionarios values('208', 'Fabiola', 'Costa', 'fabiola.costa@gmail.com', '987.703.819', '2002-08-05', '9', '5000.00', '103', '6');

##

**🔹2. A administração está sem funcionários. Inclua os outros elementos do seu grupo do demoday no departamento de administração.**

>insert into funcionarios values(209, 'Vitoria', 'Santos', 'vitoria.santos@gmail.com', '991.025.599', '2002-08-29', '3', '4500.00', '101', '1');

>insert into funcionarios values(210, 'Victor', 'Pérez', 'victor.perez@gmail.com', '945.961.147', '2002-07-05', '3', '4500.00', '101', '1');

>insert into funcionarios values(211, 'Richard', 'Alves', 'richard.alves@gmail.com', '978.125.020', '2002-08-15', '3', '4500.00', '101', '1');

>insert into funcionarios values(212, 'Kauã', 'Melo', 'kaua.melo@gmail.com', '978.156.751', '2002-08-20', '3', '4500.00', '101', '1');

>insert into funcionarios values(213, 'Ítalo', 'Sousa', 'italo.sousa@gmail.com', '987.154.964', '2002-07-05', '3', '4500.00', '101', '1');

>insert into funcionarios values(214, 'Gustavo', 'Goulart', 'gustavo.goulart@gmail.com', '910.654.448', '2002-07-25', '3', '4500.00', '101', '1');

>insert into funcionarios values(215, 'Filipe', 'Damasceno', 'filipe.damascenoz@gmail.com', '980.065.748', '2002-08-17', '3', '4500.00', '101', '1');

##

**🔹3. Agora diga, quantos funcionários temos ao total na empresa?**

Resposta: 48 funcionários

>select count(*) from funcionarios;

##

**🔹4. Quantos funcionários temos no departamento de finanças?**

Resposta: 6 funcionários

>select count(*) from funcionarios where departamento_id = 10;

##

**🔹5. Qual a média salarial do departamento de tecnologia?**

Resposta: A média é de 5633.33

>select avg(salario) from funcionarios where departamento_id = 6;

##

**🔹6. Quanto o departamento de Transportes gasta em salários?**

Resposta: Eles gastam R$41200.00

>select sum(salario) from funcionarios where departamento_id = 5;

##

**🔹7. Um novo departamento foi criado. O departamento de inovações. Ele será locado no Brasil. Por favor, adicione-o no banco de dados.**

>insert into departamento value (12, 'Inovação', '5400'); 

##

**🔹8. Novos Funcionários!**
Três novos funcionários foram contratados para o departamento de inovações. Por favor, adicione-os: William Ferreira, casado com Inara Ferreira, possui um filho chamado Gabriel que tem 4 anos e adora brincar com cachorros. Ele será programador.Já a Fernanda Lima, que é casada com o Rodrigo, não possui filhos. Ela vai ocupar a posição de desenvolvedora.  Por último, a Gerente do departamento será Fabiana Raulino. Casada, duas filhas (Maya e Laura). 
O salário de todos eles será a média salarial dos departamentos de administração e finanças.**

>select avg(salario) from funcionarios where departamento_id = 1 or departamento_id = 10;

<br>

>insert into funcionarios values(216, 'William', 'Ferreira', 'william.ferreira@gmail.com', '980.065.748', '2002-10-25', '9', '8600.00', '101', '1');

>insert into dependentes values(34, 'Inara', 'Ferreira', 'Cônjuge', 216);

>insert into dependentes values(35, 'Gabriel', 'Ferreira', 'Filho(o)', 216);

<br>

>insert into funcionarios values(217, 'Fernanda', 'Lima', 'fernanda.lima@gmail.com', '987.789.554', '2002-10-25', '17', '8600.00', '101', '1');

>insert into dependentes values(36, 'Rodrigo', 'Lima', 'Cônjuge', 217);

<br>

>insert into ocupacoes values(20, 'Gerente de Departamento', '4000.00', '8000.00');

<br>

>insert into funcionarios values(218, 'Fabiana', 'Raulino', 'fabiana.raulino@gmail.com', '905.740.889', '2002-10-25', '20', '8600.00', '104', '12');

>insert into dependentes values(37, 'Jorge', 'Raulino', 'Cônjuge', 218);

>insert into dependentes values(38, 'Laura', 'Raulino', 'Filho(a)', 218);

>insert into dependentes values(39, 'Maya', 'Raulino', 'Filho(a)', 218);

##

**🔹9. Informe todas as regiões em que a empresa atua acompanhadas de seus países.**

>select paises.pais_name, regiao.regiao_name from paises 
inner join regiao
on paises.regiao_id = regiao.regiao_id

##

**🔹10. Joe Sciarra é filho de quem?**

Resposta: Ismael Sciarra

>select funcionarios.primeiro_nome, funcionarios.sobrenome from dependentes inner join funcionarios on dependentes.funcionario_id = funcionarios.funcionario_id where dependentes.primeiro_nome like'%Joe%' and dependentes.sobrenome like '%Sciarra%';


##

**🔹11. Jose Manuel possui filhos?**

Resposta: Sim, ele se chama Christian.

>select dependentes.primeiro_nome, dependentes.parentesco from dependentes inner join funcionarios on dependentes.funcionario_id = funcionarios.funcionario_id where funcionarios.primeiro_nome like 'Jose Manuel';

##

**🔹12. Qual região possui mais países?**

Resposta: A Europa.

>select regiao.regiao_name, count(paises.regiao_id) as cont from paises inner join regiao on regiao.regiao_id = paises.regiao_id group by paises.regiao_id order by cont desc, paises.regiao_id desc limit 1;

##


**🔹13. Exiba o nome de cada funcionário acompanhado de seus dependentes.**

>select funcionarios.primeiro_nome, dependentes.primeiro_nome, dependentes.sobrenome, dependentes.parentesco from funcionarios inner join dependentes on funcionarios.funcionario_id = dependentes.funcionario_id order by funcionarios.primeiro_nome;

##

**🔹14. Karen Partners possui um cônjuge?**

Resposta: Não.

>select funcionarios.primeiro_nome, dependentes.parentesco, dependentes.primeiro_nome  from funcionarios inner join dependentes on funcionarios.funcionario_id = dependentes.funcionario_id where funcionarios.primeiro_nome like '%Karen%' and funcionarios.sobrenome like '%Partners%';

##

**🔹15. O ID da tabela de países não segue um padrão numérico. Na sua visão, qual o impacto disso no desenvolvimento do banco?**

>Nenhum impacto, pois como o id é uma chave com valor único não tem problema dele ser do tipo caractere.

##

**🔹16. Escolha um país para se mudar. Qual seria esse país? Por que escolheria esse país? E o departamento. O que seria? Como seriam seus funcionários?**

>Eu me mudaria para os Estados Unidos, pois é um dos países que tem bastante inovações e  investimentos na área de tecnologia. O meu departamento seria de analista de software e os meus funcionários seriam uma equipe diversificada e bem qualificada.

##

**🔹17. Atualize as informações na tabela para que seu departamento seja criado.**

>insert into departamento values ('13', 'Analista de Software', '1700');









