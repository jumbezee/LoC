class UpdateLocale
 def filling_locale
    @com = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'
    @com.exec "UPDATE profiles 
    SET locale = ( SELECT LEFT (country, 2) 
    FROM companies 
    WHERE companies.id = profiles.company_id 
    ORDER BY profiles.id)"
  end
end