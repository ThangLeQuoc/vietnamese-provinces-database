package common

import (
	"context"
	"database/sql"
	"fmt"
	"os"

	"github.com/uptrace/bun"
	"github.com/uptrace/bun/dialect/pgdialect"
	"github.com/uptrace/bun/driver/pgdriver"
)

func GetPostgresDBConnection() *bun.DB {
	dsn := "postgres://postgres:root@localhost:5432/vn_provinces_tmp?sslmode=disable"
	sqlDB := sql.OpenDB(pgdriver.NewConnector(pgdriver.WithDSN(dsn)))
	db := bun.NewDB(sqlDB, pgdialect.New())
	return db
}

/*
Drop all existing temporary tables
*/
func DropAllExistingTables() {
	db := GetPostgresDBConnection()
	ctx := context.Background()
	
	_, err := db.NewDropTable().Table("wards").Table("districts").Table("provinces").IfExists().Exec(ctx)
	if err != nil {
		panic(err)
	}
	fmt.Println("All temporary tables dropped")
}

func BootstrapTemporaryDatasetStructure() {
	bytesVal, err := os.ReadFile("./resources/db_table_init.sql")
	if (err != nil) {
		panic(err)
	}
	query := string(bytesVal)
	db := GetPostgresDBConnection()
	ctx := context.Background()
	db.ExecContext(ctx, query)

	fmt.Println("Temporary Provinces tables created")
}
