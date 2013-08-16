object :false
child @articles => :articles do
  attributes :id, :name, :description, :total_in_shelf, :total_in_vault, :created_at, :updated_at
  node(:price) {|art| art.humanized_price }
end
node(:success){ true }
node(:total_elements){ @articles.length }