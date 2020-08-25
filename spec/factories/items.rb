FactoryBot.define do
  factory :item do
    association :user
    name                {"あ"}
    image               {Faker::Avatar.image}
    price               {1000}
    explanation         {"あ"}
    category_id         {2}
    product_status_id   {2}
    shipping_area_id    {2}
    date_of_shipment_id {2}
    delivery_fee_id     {2}
  end
end
