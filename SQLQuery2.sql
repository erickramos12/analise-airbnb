-- INSERINDO DADOS DO CSV NA TABELA SQL

/*CREATE TABLE AirBnb(
	id VARCHAR(MAX),	listing_url VARCHAR(MAX),	scrape_id VARCHAR(MAX),	last_scraped VARCHAR(MAX),	name VARCHAR(MAX),	summary VARCHAR(MAX),	space VARCHAR(MAX),	description VARCHAR(MAX),	experiences_offered VARCHAR(MAX),	neighborhood_overview VARCHAR(MAX),	notes VARCHAR(MAX),	transit VARCHAR(MAX),	access VARCHAR(MAX),	interaction VARCHAR(MAX),	house_rules VARCHAR(MAX),	thumbnail_url VARCHAR(MAX),	medium_url VARCHAR(MAX),	picture_url VARCHAR(MAX),	xl_picture_url VARCHAR(MAX),	host_id VARCHAR(MAX),	host_url VARCHAR(MAX),	host_name VARCHAR(MAX),	host_since VARCHAR(MAX),	host_location VARCHAR(MAX),	host_about VARCHAR(MAX),	host_response_time VARCHAR(MAX),	host_response_rate VARCHAR(MAX),	host_acceptance_rate VARCHAR(MAX),	host_is_superhost VARCHAR(MAX),	host_thumbnail_url VARCHAR(MAX),	host_picture_url VARCHAR(MAX),	host_neighbourhood VARCHAR(MAX),	host_listings_count VARCHAR(MAX),	host_total_listings_count VARCHAR(MAX),	host_verifications VARCHAR(MAX),	host_has_profile_pic VARCHAR(MAX),	host_identity_verified VARCHAR(MAX),	street VARCHAR(MAX),	neighbourhood VARCHAR(MAX),	neighbourhood_cleansed VARCHAR(MAX),	neighbourhood_group_cleansed VARCHAR(MAX),	city VARCHAR(MAX),	state VARCHAR(MAX),	zipcode VARCHAR(MAX),	market VARCHAR(MAX),	smart_location VARCHAR(MAX),	country_code VARCHAR(MAX),	country VARCHAR(MAX),	latitude VARCHAR(MAX),	longitude VARCHAR(MAX),	is_location_exact VARCHAR(MAX),	property_type VARCHAR(MAX),	room_type VARCHAR(MAX),	accommodates VARCHAR(MAX),	bathrooms VARCHAR(MAX),	bedrooms VARCHAR(MAX),	beds VARCHAR(MAX),	bed_type VARCHAR(MAX),	amenities VARCHAR(MAX),	square_feet VARCHAR(MAX),	price VARCHAR(MAX),	weekly_price VARCHAR(MAX),	monthly_price VARCHAR(MAX),	security_deposit VARCHAR(MAX),	cleaning_fee VARCHAR(MAX),	guests_included VARCHAR(MAX),	extra_people VARCHAR(MAX),	minimum_nights VARCHAR(MAX),	maximum_nights VARCHAR(MAX),	calendar_updated VARCHAR(MAX),	has_availability VARCHAR(MAX),	availability_30 VARCHAR(MAX),	availability_60 VARCHAR(MAX),	availability_90 VARCHAR(MAX),	availability_365 VARCHAR(MAX),	calendar_last_scraped VARCHAR(MAX),	number_of_reviews VARCHAR(MAX),	first_review VARCHAR(MAX),	last_review VARCHAR(MAX),	review_scores_rating VARCHAR(MAX),	review_scores_accuracy VARCHAR(MAX),	review_scores_cleanliness VARCHAR(MAX),	review_scores_checkin VARCHAR(MAX),	review_scores_communication VARCHAR(MAX),	review_scores_location VARCHAR(MAX),	review_scores_value VARCHAR(MAX),	requires_license VARCHAR(MAX),	license VARCHAR(MAX),	jurisdiction_names VARCHAR(MAX),	instant_bookable VARCHAR(MAX),	is_business_travel_ready VARCHAR(MAX),	cancellation_policy VARCHAR(MAX),	require_guest_profile_picture VARCHAR(MAX),	require_guest_phone_verification VARCHAR(MAX),	calculated_host_listings_count VARCHAR(MAX),	reviews_per_month VARCHAR(MAX),	Ano VARCHAR(MAX),	Mes VARCHAR(MAX),	minimum_minimum_nights VARCHAR(MAX),	maximum_minimum_nights VARCHAR(MAX),	minimum_maximum_nights VARCHAR(MAX),	maximum_maximum_nights VARCHAR(MAX),	minimum_nights_avg_ntm VARCHAR(MAX),	maximum_nights_avg_ntm VARCHAR(MAX),	number_of_reviews_ltm VARCHAR(MAX),	calculated_host_listings_count_entire_homes VARCHAR(MAX),	calculated_host_listings_count_private_rooms VARCHAR(MAX),	calculated_host_listings_count_shared_rooms VARCHAR(MAX)
)


BULK INSERT AirBnb
FROM 'D:\Jupyter\Portifólio Análise de dados\Projeto Airbnb\Airbnb.csv'
WITH(
FIELDTERMINATOR = '|',
CODEPAGE = '65001')*/




-- CRIANDO VIEW PARA LEVAR OS DADOS AO POWER BI

CREATE OR ALTER VIEW AirBnbPBI
AS
SELECT
	host_name AS 'Nome do Anfitrião',
	host_since AS 'Aluga Desde',
	host_location AS 'Localização do Anfitrião',
	host_response_time AS 'Tempo Médio de Resposta',
	host_response_rate AS 'Taxa de Resposta',
	REPLACE(REPLACE(host_is_superhost, 'f', 'Não'), 'f', 'Sim') AS 'Anfitrião de Alto Desempenho?',
	host_neighbourhood AS 'Bairro do Anfitrião',
	host_total_listings_count AS 'Total de Apartamentos',
	REPLACE(REPLACE(host_has_profile_pic, 'f', 'Não'), 't', 'Sim') AS 'Anfitrião com Foto?',
	REPLACE(REPLACE(host_identity_verified, 'f', 'Não'), 't', 'Sim') AS 'Anfitrião Verificado?',
	neighbourhood AS 'Bairro do Apartamento',
	latitude AS 'Latitudade',
	longitude AS 'Longitude',
	property_type AS 'Tipo da Propriedade',
	room_type AS 'Tipo do Quarto',
	accommodates AS 'Quantidade de Benefícios',
	bathrooms AS 'Quantidade de Banheiros',
	bedrooms AS 'Quantidade de Quartos',
	beds AS 'Quantidade de Camas',
	bed_type AS 'Tipo da Cama',
	price AS 'Preço',
	security_deposit AS 'Depósito de Segurança',
	guests_included AS 'Quantidade Máxima de Pessoas',
	extra_people AS 'Valor por Pessoa Extra',
	REPLACE(REPLACE(has_availability, 'f', 'Não'), 't', 'Sim') AS 'Disponível?',
	number_of_reviews AS 'Quantidade de Review',
	IIF(first_review IS NOT NULL, 'Sim', 'Não') AS 'Teve Review?',
	review_scores_accuracy AS 'Nota do Review',
	cancellation_policy AS 'Política de Cancelamento',
	reviews_per_month AS 'Quantidade de Review po Mês',
	Ano,
	Mes AS 'Mês'
FROM
	AirBnb