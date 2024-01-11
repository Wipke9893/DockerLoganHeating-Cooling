package org.logan.dao;

import org.logan.model.Data;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import java.sql.Timestamp;  // Corrected import
import java.util.List;
import java.util.ArrayList;
import java.util.Random;

@Component
public class JdbcDataDao implements DataDao {

    private final JdbcTemplate jdbcTemplate;
    private final Random random = new Random();

    public JdbcDataDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Data> listData() {
        List<Data> datas = new ArrayList<>();
        String sql = "SELECT * FROM chart_data ORDER BY timestamp DESC;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Data data = mapRowToData(results);
            datas.add(data);
        }
        return datas;
    }

    @Scheduled(fixedRate = 10000) // Executes every 10000 milliseconds (90 seconds)
    public void generateRandomData() {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        int randomValue = random.nextInt(100); // Generate a random value

        jdbcTemplate.update("INSERT INTO chart_data (timestamp, value) VALUES (?, ?)",
                timestamp, randomValue);
    }

    private Data mapRowToData(SqlRowSet rs) {
        Data data = new Data();
        data.setTimestamp(rs.getTimestamp("timestamp"));
        data.setValue(rs.getInt("value"));
        return data;
    }
}

