<h2 align='center'> Banco de Dados (MySQL)</h2>

### Empresa Momento

A Momento é uma empresa única que faz o melhor que pode para alcançar o melhor da humanidade. 
##
<br>

**🔹1. Inclua suas próprias informações no departamento de tecnologia da empresa.**

>insert into funcionarios values('208', 'Fabiola', 'Costa', 'fabiola.costa@gmail.com', '987.703.819', '2002-08-05', '9', '5000.00', '103', '6');

![img1](https://user-images.githubusercontent.com/110692074/198166597-e783d69d-03b8-4aad-9537-cfc6dd581956.png)

<hr>

**🔹2. A administração está sem funcionários. Inclua os outros elementos do seu grupo do demoday no departamento de administração.**

>insert into funcionarios values(209, 'Vitoria', 'Santos', 'vitoria.santos@gmail.com', '991.025.599', '2002-08-29', '3', '4500.00', '101', '1');

>insert into funcionarios values(210, 'Victor', 'Pérez', 'victor.perez@gmail.com', '945.961.147', '2002-07-05', '3', '4500.00', '101', '1');

>insert into funcionarios values(211, 'Richard', 'Alves', 'richard.alves@gmail.com', '978.125.020', '2002-08-15', '3', '4500.00', '101', '1');

>insert into funcionarios values(212, 'Kauã', 'Melo', 'kaua.melo@gmail.com', '978.156.751', '2002-08-20', '3', '4500.00', '101', '1');

>insert into funcionarios values(213, 'Ítalo', 'Sousa', 'italo.sousa@gmail.com', '987.154.964', '2002-07-05', '3', '4500.00', '101', '1');

>insert into funcionarios values(214, 'Gustavo', 'Goulart', 'gustavo.goulart@gmail.com', '910.654.448', '2002-07-25', '3', '4500.00', '101', '1');

>insert into funcionarios values(215, 'Filipe', 'Damasceno', 'filipe.damascenoz@gmail.com', '980.065.748', '2002-08-17', '3', '4500.00', '101', '1');

![img2](https://user-images.githubusercontent.com/110692074/198167045-9fa8f132-c933-40fe-bbea-f5611d4f5323.png)

<hr>

**🔹3. Agora diga, quantos funcionários temos ao total na empresa?**

Resposta: 48 funcionários

>select count(*) from funcionarios;

![img3](https://user-images.githubusercontent.com/110692074/198167511-1ddc0459-e532-488a-a356-a0e4e8a45436.png)

<hr>

**🔹4. Quantos funcionários temos no departamento de finanças?**

Resposta: 6 funcionários

>select count(*) from funcionarios where departamento_id = 10;

![img4](https://user-images.githubusercontent.com/110692074/198168053-588ad6dd-1e9c-4d4a-892a-276d49f1c8fc.png)

<hr>

**🔹5. Qual a média salarial do departamento de tecnologia?**

Resposta: A média é de 5633.33

>select avg(salario) from funcionarios where departamento_id = 6;

![img5](https://user-images.githubusercontent.com/110692074/198168441-03114d5f-54c4-47e9-94a9-08261a9005d9.png)

<hr>

**🔹6. Quanto o departamento de Transportes gasta em salários?**

Resposta: Eles gastam R$41200.00

>select sum(salario) from funcionarios where departamento_id = 5;

![img6](https://user-images.githubusercontent.com/110692074/198168445-ec505766-8701-454a-bd1e-9185f10b766b.png)

<hr>

**🔹7. Um novo departamento foi criado. O departamento de inovações. Ele será locado no Brasil. Por favor, adicione-o no banco de dados.**

>insert into departamento value (12, 'Inovação', '5400'); 

![img7](https://user-images.githubusercontent.com/110692074/198168447-5329611f-8ea4-4c59-b5ec-6ab177828fa1.png)

<hr>

**🔹8. Novos Funcionários!**
Três novos funcionários foram contratados para o departamento de inovações. Por favor, adicione-os: William Ferreira, casado com Inara Ferreira, possui um filho chamado Gabriel que tem 4 anos e adora brincar com cachorros. Ele será programador.Já a Fernanda Lima, que é casada com o Rodrigo, não possui filhos. Ela vai ocupar a posição de desenvolvedora.  Por último, a Gerente do departamento será Fabiana Raulino. Casada, duas filhas (Maya e Laura). 
O salário de todos eles será a média salarial dos departamentos de administração e finanças.**

>select avg(salario) from funcionarios where departamento_id = 1 or departamento_id = 10;

![img8](https://user-images.githubusercontent.com/110692074/198169936-d2491086-87cc-4059-ba61-e6feec04d797.png)

<br>

>insert into funcionarios values(216, 'William', 'Ferreira', 'william.ferreira@gmail.com', '980.065.748', '2002-10-25', '9', '6250.00', '101', '1');

>insert into dependentes values(34, 'Inara', 'Ferreira', 'Cônjuge', 216);

>insert into dependentes values(35, 'Gabriel', 'Ferreira', 'Filho(o)', 216);

<br>

>insert into funcionarios values(217, 'Fernanda', 'Lima', 'fernanda.lima@gmail.com', '987.789.554', '2002-10-25', '17', '6250.00', '101', '1');

>insert into dependentes values(36, 'Rodrigo', 'Lima', 'Cônjuge', 217);

<br>

>insert into ocupacoes values(20, 'Gerente de Departamento', '4000.00', '8000.00');

<br>

>insert into funcionarios values(218, 'Fabiana', 'Raulino', 'fabiana.raulino@gmail.com', '905.740.889', '2002-10-25', '20', '6250.00', '104', '12');

>insert into dependentes values(37, 'Jorge', 'Raulino', 'Cônjuge', 218);

>insert into dependentes values(38, 'Laura', 'Raulino', 'Filho(a)', 218);

>insert into dependentes values(39, 'Maya', 'Raulino', 'Filho(a)', 218);

Tabela funcionário

![img8 1](https://user-images.githubusercontent.com/110692074/198171748-f95e0213-1380-4635-9349-6127f7495ea5.png)

Tabela dependentes

![img8 2](https://user-images.githubusercontent.com/110692074/198170822-cac909e8-6ace-4cc3-b25b-ee46e8a5e8a0.png)

<hr>

**🔹9. Informe todas as regiões em que a empresa atua acompanhadas de seus países.**

>select paises.pais_name, regiao.regiao_name from paises 
inner join regiao
on paises.regiao_id = regiao.regiao_id

![img9](https://user-images.githubusercontent.com/110692074/198172416-084b7280-d5dc-4bcb-8109-8558ef0b7ee6.png)

<hr>

**🔹10. Joe Sciarra é filho de quem?**

Resposta: Ismael Sciarra

>select funcionarios.primeiro_nome, funcionarios.sobrenome from dependentes inner join funcionarios on dependentes.funcionario_id = funcionarios.funcionario_id where dependentes.primeiro_nome like'%Joe%' and dependentes.sobrenome like '%Sciarra%';

![img10](https://user-images.githubusercontent.com/110692074/198172422-e248474a-8f51-405f-b69c-4d550154dbd8.png)

<hr>

**🔹11. Jose Manuel possui filhos?**

Resposta: Sim, ele se chama Christian.

>select dependentes.primeiro_nome, dependentes.parentesco from dependentes inner join funcionarios on dependentes.funcionario_id = funcionarios.funcionario_id where funcionarios.primeiro_nome like 'Jose Manuel';

![img11](https://user-images.githubusercontent.com/110692074/198172425-307d6982-0e93-4e6c-b13d-5db186dd0a0b.png)

<hr>

**🔹12. Qual região possui mais países?**

Resposta: A Europa.

>select regiao.regiao_name, count(paises.regiao_id) as cont from paises inner join regiao on regiao.regiao_id = paises.regiao_id group by paises.regiao_id order by cont desc, paises.regiao_id desc limit 1;

![img12](https://user-images.githubusercontent.com/110692074/198172427-a0e6e4f3-2a47-4745-a08b-aae7a1b49135.png)

<hr>


**🔹13. Exiba o nome de cada funcionário acompanhado de seus dependentes.**

>select funcionarios.primeiro_nome, dependentes.primeiro_nome, dependentes.sobrenome, dependentes.parentesco from funcionarios inner join dependentes on funcionarios.funcionario_id = dependentes.funcionario_id order by funcionarios.primeiro_nome;

![img13](https://user-images.githubusercontent.com/110692074/198173019-a4184a9f-dc07-4d74-927e-806d49fff9d5.png)

<hr>

**🔹14. Karen Partners possui um cônjuge?**

Resposta: Não.

>select funcionarios.primeiro_nome, dependentes.parentesco, dependentes.primeiro_nome  from funcionarios inner join dependentes on funcionarios.funcionario_id = dependentes.funcionario_id where funcionarios.primeiro_nome like '%Karen%' and funcionarios.sobrenome like '%Partners%';

![img14](https://user-images.githubusercontent.com/110692074/198173023-93d5bb67-f01f-44c8-93e7-f3d8d360f389.png)


<hr>

**🔹15. O ID da tabela de países não segue um padrão numérico. Na sua visão, qual o impacto disso no desenvolvimento do banco?**

>Nenhum impacto, pois como o id é uma chave com valor único não tem problema dele ser do tipo caractere.

<hr>

**🔹16. Escolha um país para se mudar. Qual seria esse país? Por que escolheria esse país? E o departamento. O que seria? Como seriam seus funcionários?**

>Eu me mudaria para os Estados Unidos, pois é um dos países que tem bastante inovações e  investimentos na área de tecnologia. O meu departamento seria de analista de software e os meus funcionários seriam uma equipe diversificada e bem qualificada.

<hr>

**🔹17. Atualize as informações na tabela para que seu departamento seja criado.**

>insert into departamento values ('13', 'Analista de Software', '1700');

![img17](https://user-images.githubusercontent.com/110692074/198173024-56a6e55e-9f31-49a6-a67d-e002abefa713.png)










