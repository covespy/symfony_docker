symfony new .
composer req doctrine twig
composer req --dev maker ormfixtures fakerphp/faker
composer require symfony/webpack-encore-bundle
npm install
composer require annotations
cp .env .env.local
sed -i 's,^DATABASE_URL=.*,DATABASE_URL="mysql://root:dbsecret@database:3306/symfony?serverVersion=8.0",g' .env.local
touch dbpassword
cat dbpassword | xargs --replace=INSERTED -- sed -i 's,dbsecret,INSERTED,g' .env.local
rm dbpassword
npm install bootstrap --save-dev
npm install
# if assets/ folder is owned by root, run
# sudo chown -R {{ username }}: assets/
echo -e "\$primary: darken(#428bca, 20%);\n@import \"~bootstrap/scss/bootstrap\";\n" >> assets/styles/_global.scss
npm install react react-dom prop-types --save
npm install jquery --save-dev
npm install sass-loader sass --save-dev
# Uncomment .enableSassLoader() to enable sass/scss processing
# rename app.css to app.scss
# add to app.scss:
# @import "global"
# in app.js, change import './styles/app.css'; to import './styles/app.scss';
# Uncomment //.enableReactPreset() in webpack.config.js
# add to assets/app.js: import jquery from 'jquery';
# for custom js:
#   // assets/custom.js
#   use .addentry in webpack.config.js
#    .addEntry('checkout', './assets/checkout.js')
#   in the template:
#   + {% block stylesheets %}
#   +     {{ parent() }}
#   +     {{ encore_entry_link_tags('checkout') }}
#   + {% endblock %}
#
#   + {% block javascripts %}
#   +     {{ parent() }}
#   +     {{ encore_entry_script_tags('checkout') }}
#   + {% endblock %}
