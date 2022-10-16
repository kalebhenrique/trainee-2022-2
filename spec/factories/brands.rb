FactoryBot.define do
  # Nome de brand deve ser único. Devemos garantir que chamae
  # create(:brand) duas vezes não irá dar problemas por usar o
  # mesmo nome, então criamos uma sequencia para que o nome nunca
  # se repita, a nao ser que propositalmente
  sequence :brand_names do |n|
    "Brand #{n}"
  end
  factory :brand do
    # generate chama a sequência.
    name { generate(:brand_names) }
  end
end
