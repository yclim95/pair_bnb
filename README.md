# README

## 1.0 Simple user online reservations : 

1) Languages included:

	1.1) Ruby 
	1.2) HTML (.erb)
	1.3) CSS
	1.4) Javascript


2) Applied ActiveRecord and Postgresql 

	2.1) User (database)
	2.2) Authentication (database)


3) Applied Gem 

	3.1) Clearance 
	3.2) Figaro
	3.3) omniauth-facebook
	3.4) omniauth

---

## 2.0 Gems Links 

[Clearance](https://github.com/thoughtbot/clearance)  
[Figaro](https://github.com/laserlemon/figaro)  
[omniauth-facebook](https://github.com/mkdynamic/omniauth-facebook)  

## <a name="resources"></a> 3.0 Resources 

1. [Clearance](https://github.com/thoughtbot/clearance)
2. [Clearance_sample](http://www.sitepoint.com/simple-rails-authentication-with-clearance/)
3. [Clearance_sample](https://docs.omniref.com/ruby/gems/clearance/1.8.0)
4. [Clearance_email_sample ](https://robots.thoughtbot.com/email-confirmation-with-clearance)
5. [Figaro](https://github.com/laserlemon/figaro)
6. [omniauth-facebook](https://github.com/mkdynamic/omniauth-facebook)

---

## 4.0 Usages

1) Commands
```sh
	1.1) gem 'clearance'
```

		1.1.1) After bundle install , Run this line of code ($ rails generate clearance:install)

		1.1.2) MUST "bundle exec rake db:migrate"

```sh
	2.1) gem "figaro"
```
```bash
		2.1.1) $ bundle exec figaro install
```

2) Rename README.extension 

	2.1) git mv README.rdoc README.md