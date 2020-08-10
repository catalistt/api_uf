class UfPrice < ApplicationRecord
  validates :date, uniqueness: true

  def self.load_ufs
    require 'csv'
    csv_text = File.read('tmp/UF2020.csv')
    csv = CSV.parse(csv_text, headers: true, col_sep: ";")

    csv.each do |months|
      months.each_with_index do |uf,index|
        next if index.zero? || uf[1].nil?
        date = Date.new(2020,index,months[0].to_i)
        uf_aux = uf[1].gsub(".","").gsub(",",".")
        UfPrice.create(date: date, uf: uf_aux.to_f)
        end
      end
  end
end