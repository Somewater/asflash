class Portfolio < TextPage
  self.table_name = :portfolio
  i18n_columns :preview

	def to_param
		self.name
	end
end
