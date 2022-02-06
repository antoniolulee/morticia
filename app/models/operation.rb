class Operation < ApplicationRecord
    validates :requested_money, :buying_price, :appraisal_price, :years_duration, :year_of_birth, :annual_gross_income, :city, :name, :interest_type, :email, presence: true

    validates :requested_money, numericality: { greater_than_or_equal_to: 50000, less_than_or_equal_to: 1000000 }
    validates :buying_price, numericality: { greater_than_or_equal_to: 50000, less_than_or_equal_to: 1500000 }
    validates :appraisal_price, numericality: { greater_than_or_equal_to: 50000, less_than_or_equal_to: 1500000 }
    validates :years_duration, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 35 }
    validates :year_of_birth, numericality: { greater_than_or_equal_to: (Date.current.year - 50) , less_than_or_equal_to: (Date.current.year - 18) }
    validates :annual_gross_income, numericality: { greater_than_or_equal_to: 10000, less_than_or_equal_to: 500000 }
    validates :city, length: { minimum: 3, maximum: 21 }, format: { with: /\A[a-zA-Z]+\z/, message: "solamente se permiten letras" }
    validates :name, length: { minimum: 3, maximum: 15 }
    validates :interest_type, length: { minimum: 4, maximum: 8 }, format: { with: /\A[a-zA-Z]+\z/, message: "solamente se permiten letras" }
    validates :email, length: { minimum: 3, maximum: 42 }, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "El correo electrónico debe ser válido" }

end
