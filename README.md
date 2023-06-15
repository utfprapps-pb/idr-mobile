```yaml
- /lib/aplicativo
# Aqui é onde todos os diretórios do aplicativo estarão contidos
     - /dados
     # Diretório responsável por conter tudo relacionado aos nossos dados
         - /enums
         - /services
              # É aqui que armazenamos nossos Serviços
              # Aqui nossos repositórios são apenas classes que irão mediar a comunicação entre nosso controller e nossos dados.
              # Nossos controladores não precisam saber de onde vêm os dados e você pode usar mais de um repositório em um controlador, se precisar.
              # Os repositórios devem ser separados por entidades, e quase sempre podem ser baseados em suas tabelas de banco de dados.
              # E dentro dele conterá todas as suas funções que solicitarão dados de uma API ou banco de dados local.
              # Ou seja, se tivermos uma tabela de usuários que iremos persistir como, editar, adicionar, atualizar e deletar, todas essas funções são solicitadas de uma api, teremos um repositório com esse objeto da api onde chamaremos todas as respectivos funções para o usuário. 
              # Assim o controlador não precisa saber de onde vem, sendo o repositório um atributo obrigatório para os controladores neste modelo, você deve sempre inicializar o controlador com at - /repository
            - /example_service.dart
                - service.dart
                - repository.dart
        - /provider
        # Nosso provedor de dados, pode ser uma API, banco de dados local ou firebase por exemplo.
            - api_provider.dart
            - db_provider.dart
            - storage_provider.dart
        # Aqui, nossa solicitação de dados assíncronos, http, funções de banco de dados local devem permanecer ...
        - /model
        # Nossas classes, ou modelos de dados responsáveis por abstrair nossos objetos.
            - model.dart
    - /modules
    # Cada módulo consiste em uma página, seu respectivo GetXController e suas dependências ou Bindings.
    # Tratamos cada tela como um módulo independente, pois ela possui seu único controlador, podendo conter também suas dependências.
    # Se você usar widgets reutilizáveis neste, e somente neste módulo, você pode optar por adicionar uma pasta para eles.
        - /my_module
            - page.dart
            - controller.dart
            - binding.dart
            - repository.dart
            - /local_widgets
    # A classe Binding é uma classe que separa a injeção de dependência, enquanto "vincula" rotas para o gerenciador de estado e o gerenciador de dependência.
    # Isso permite que você saiba qual tela está sendo exibida quando um controlador específico é usado e sabe onde e como descartá-lo.
    # Além disso, a classe Binding permite que você tenha controle de configuração do SmartManager.
    # Você pode configurar como as dependências serão organizadas e remover uma rota da pilha, ou quando o widget usado para disposição, ou nenhum deles.
    # A decisão de transferir os repositórios "globalmente" para modos internos dentro de cada módulo é que podemos usar uma função em módulos diferentes, mas o problema era ter que importar mais de um repositório no controller, então podemos repetir o mesmo funções de chamadas, repositórios internos, mantendo assim uma manutenção mais rápida, tornando tudo que dá vida ao módulo acessível através do próprio módulo.
    # Repositórios então se tornam apenas uma classe para apontar os controladores do nosso módulo, qual e qual provedor vamos consumir, o mesmo vale para serviços, serviços que possuem integração com algum provedor, devem ter seu próprio repositório

    - /global_widgets or widgets 
    # Widgets que podem ser reutilizados por vários **módulos**.  

    - /routes
    # Neste repositório iremos depositar nossas rotas e páginas.
    # Optamos por separar em dois arquivos, e duas classes, sendo uma routes.dart, contendo suas rotas constantes e outra para roteamento. 
        - routes.dart
        # class Routes {
        # Este arquivo conterá suas constantes ex:
        # class Routes { const HOME = '/ home'; }  
        - pages.dart
        # Este arquivo conterá seu roteamento de matriz ex: 
        # class AppPages { static final pages = [  
        #  GetPage(name: Routes.HOME, page:()=> HomePage()) 
        # ]};  
    - /core
        - /errors
        # tratamento de erros e classes
        - /values
            - strings.dart
            # strings globalmente reutilizáveis
            # exemplo: submit > "Submit" em vários botões
            - colors.dart
            # cores que podem ser reutilizadas em todo o aplicativo
            - /languages
            # para aplicações que utilizam internacionalização, podem depositar seus arquivos de tradução aqui
                - /from
                    - pt-br.dart
                    - en-au.dart
        - /theme
        # Aqui podemos criar temas para nossos widgets, textos e cores
            - text_theme.dart  
            # ex: final textTitle = TextStyle(fontSize: 30)  
            - color_theme.dart  
            # ex: final colorCard = Color(0xffEDEDEE)  
            - app_theme.dart  
            # ex: final textTheme = TextTheme(headline1: TextStyle(color: colorCard))  
        - /utils
        # Aqui você pode inserir utilitários para sua aplicação, como máscaras, teclas de formulário ou widgets
            - /extensions
                # são uma maneira de adicionar funcionalidade a bibliotecas existentes
                - example_remove_underlines.dart
                # https://dart.dev/guides/language/extension-methods
                
            - /functions
            # funções que podem ser reutilizadas globalmente no aplicativo
                - get_percent_size.dart
                # example: a function that returns the percentage of a parent widget
                
            - /helpers
            # classes abstratas ou classes auxiliares como máscaras de chave, etc.
                - masks.dart  
                # inside ex: static final maskCPF = MaskTextInputFormatter(mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]'