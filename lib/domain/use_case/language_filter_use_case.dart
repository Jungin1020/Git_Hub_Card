class LanguageFilterUseCase {
  String filterLanguage(String lang) {
    switch (lang) {
      case 'adonisjs':
        return 'adonis';
      case 'aftereffects':
        return 'effects';
      case 'amazonwebservices':
        return 'aws';
      case 'androidstudio':
        return 'ans';
      case 'angularjs':
        return 'angular';
      case 'apachekafka':
        return 'apache';
      case 'appcelerator':
        return 'apcltr';
      case 'backbonejs':
        return 'bbone';
      case 'bitbucket':
        return 'bbucket';
      case 'bootstrap':
        return 'bstrp';
      case 'circleci':
        return 'circle';
      case 'clojurescript':
        return 'clojure';
      case 'codeigniter':
        return 'igniter';
      case 'coffeescript':
        return 'coffee';
      case 'confluence':
        return 'cflnc';
      case 'dotnetcore':
        return 'dotnet';
      case 'digitalocean':
        return 'ocean';
      case 'embeddedc':
        return 'ebdc';
      case 'feathersjs':
        return 'feathers';
      case 'filezilla':
        return 'fzllr';
      case 'foundation':
        return 'fndn';
      case 'googlecloud':
        return 'cloud';
      case 'handlebars':
        return 'handle';
      case 'illustrator':
        return 'illust';
      case 'javascript':
        return 'jscript';
      case 'jetbrains':
        return 'jtbs';
      case 'kubernetes':
        return 'k8s';
      case 'materialui':
        return 'matui';
      case 'nodewebkit':
        return 'webkit';
      case 'objectivec':
        return 'objc';
      case 'photoshop':
        return 'ptshp';
      case 'postgresql':
        return 'postgres';
      case 'premierepro':
        return 'premiere';
      case 'processing':
        return 'pcss';
      case 'protractor':
        return 'prtr';
      case 'raspberrypi':
        return 'raspi';
      case 'salesforce':
        return 'sfdc';
      case 'sequelize':
        return 'sqlz';
      case 'sourcetree':
        return 'stree';
      case 'sqlalchemy':
        return 'alchemy';
      case 'subversion':
        return 'sversion';
      case 'microsoftsqlserver':
        return 'mssql';
      case 'storybook':
        return 'story';
      case 'tailwindcss':
        return 'tailwind';
      case 'tensorflow':
        return 'tensor';
      case 'terraform':
        return 'terra';
      case 'tortoisegit':
        return 'tortoise';
      case 'thealgorithms':
        return 'algrthm';
      case 'typescript':
        return 'tscript';
      case 'unrealengine':
        return 'unreal';
      case 'visualstudio':
        return 'vstudio';
      case 'vuestorefront':
        return 'vsf';
      case 'woocommerce':
        return 'wooco';
      case 'wordpress':
        return 'wpress';
      case 'prometheus':
        return 'pmts';
      case 'dropwizard':
        return 'dwzrd';
      default:
        return lang;
    }
  }
}
