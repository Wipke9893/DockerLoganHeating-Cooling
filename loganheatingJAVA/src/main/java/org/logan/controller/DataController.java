package org.logan.controller;

import org.logan.dao.DataDao;
import org.logan.model.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
public class DataController {

    private final DataDao dataDao;

    @Autowired
    public DataController(DataDao dataDao) {
        this.dataDao = dataDao;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/barChartData", method = RequestMethod.GET)
    public List<Data> getData(Principal principal) {
        return this.dataDao.listData();
    }
}
