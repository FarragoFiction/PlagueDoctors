json.extract! paldemic_file, :id, :name, :author, :num_downloads, :num_upvotes, :num_downvotes, :created_at, :updated_at, :file
json.url paldemic_file_url(paldemic_file, format: :json)
