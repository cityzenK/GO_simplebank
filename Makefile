createdb:
	docker exec -it postgres createdb --username=egoh --owner=egoh simple_bank

dropdb:
	docker exec -it postgres dropdb -U egoh simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://egoh:password@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://egoh:password@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: createdb  dropdb migrateup migratedown
