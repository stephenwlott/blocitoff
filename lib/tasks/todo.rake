namespace :todo do
  desc "Deletes To-Do Items older than seven days"
  # To execute, enter the following command in the terminal window:
  # rake todo:delete_items
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end
