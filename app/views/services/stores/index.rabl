object :false
child @stores => :stores do
  attributes :id, :name, :address, :created_at, :updated_at
end
node(:success){ true }
node(:total_elements){ @stores.length }