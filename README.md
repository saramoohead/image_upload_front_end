Rails front end for https://github.com/saramoohead/jsonapi_resources_exercise

Direct upload from browser to AWS S3. Processes AWS response into a POST request with dynamic S3 image address for the API. Cannot currently PATCH request appropriately with the caption.

```
git clone git@github.com:saramoohead/image_upload_front_end.git
cd image_upload_front_end
bundle install
rake db:create
rake db:migrate
rails s
visit http://localhost:3000

```
