class ProductDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      id:             { source: "Product.id" },
      name:           { source: "Product.name" },
      description:    { source: "Product.description" },
      price:          { source: "Product.price", searchable: false },
      availability:   { source: "Product.availability" },
      img_url:        { source: "Product.img_url" }
    }
  end
  def data
    records.map do |record|
      {
          id:             record.id,
          name:           record.name,
          description:    record.description,
          price:          record.price,
          availability:   record.availability,
          img_url:        record.img_url,
          DT_RowId:       record.id

      }
    end
  end
  def get_raw_records
    Product.all
  end
end