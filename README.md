# OmniAuth Behance

This gem contains the Behance strategy for OmniAuth.

## Before You Begin

You should have already installed OmniAuth into your app; if not, read the [OmniAuth README](https://github.com/intridea/omniauth) to get started.

Now sign in into the [Behance developer area](http://www.behance.net/dev) and create an application. Take note of your Client Id and Client Secret because that is what your web application will use to authenticate against the Behance API.

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-behance'
```

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :behance, "CLIENT_KEY", "CLIENT_SECRET", { scope: 'collection_read|wip_read|project_read' }
end
```

Replace CLIENT_KEY and CLIENT_SECRET with the appropriate values you obtained from Behance earlier. The value of the scope parameter is the [keys of permissions](http://www.behance.net/dev/authentication#scopes) you wish to access from the API.

## Authentication Hash
An example auth hash available in `request.env['omniauth.auth']`:

```ruby
{
  "provider": "behance",
  "uid": "4363757",
  "info": {
    "first_name": "Luca",
    "last_name": "Spiller",
    "username": "lucaspiller",
    "city": "London",
    "country": "United Kingdom",
    "state": "",
    "occupation": "",
    "url": "http://www.behance.net/lucaspiller",
    "display_name": "Luca Spiller",
    "full_name": "Luca Spiller",
    "image": "https://m1.behance.net/profiles21/4363757/7b9d3d985b4da4282e562fc697f603e3.jpg",
    "name": "Luca Spiller"
  },
  "credentials": {
    "token": "nbal...",
    "expires": false
  },
  "extra": {
    "raw_info": {
      "id": 4363757,
      "first_name": "Luca",
      "last_name": "Spiller",
      "username": "lucaspiller",
      "city": "London",
      "state": "",
      "country": "United Kingdom",
      "company": "",
      "occupation": "",
      "created_on": 1386346045,
      "url": "http://www.behance.net/lucaspiller",
      "images": {
        "50": "https://m1.behance.net/profiles21/4363757/50x7b9d3d985b4da4282e562fc697f603e3.jpg",
        "115": "https://m1.behance.net/profiles21/4363757/115x7b9d3d985b4da4282e562fc697f603e3.jpg",
        "138": "https://m1.behance.net/profiles21/4363757/7b9d3d985b4da4282e562fc697f603e3.jpg"
      },
      "display_name": "Luca Spiller",
      "fields": [

      ],
      "twitter": "",
      "links": [

      ],
      "sections": [

      ],
      "website": "",
      "stats": {
        "followers": 1,
        "following": 1,
        "appreciations": 0,
        "views": 0,
        "comments": 0
      }
    }
  }
}
```

The `access_token` parameter to make further API requests is available in `request.env['omniauth.auth']["credentials"]["token"]`. Note that this does not expire.
