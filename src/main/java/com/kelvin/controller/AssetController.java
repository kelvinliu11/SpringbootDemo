package com.kelvin.controller;

import com.kelvin.domain.PolAsset;
import com.kelvin.service.AssetService;
import com.kelvin.vo.ResponseVo;
import com.kelvin.vo.asset.AssetQueryVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Author: Kelvin
 * @Description:
 * @Date: 2017/7/2.21:13
 */
@Controller
public class AssetController {

    private static final Logger logger = LoggerFactory.getLogger(AssetController.class);

    @Autowired
    AssetService assetService;

    @RequestMapping("/asset/showAsset")
    public ModelAndView showAssets(AssetQueryVo assetVo) {
        List<PolAsset> allAssets = assetService.queryAllAssets(assetVo);
        ModelAndView mv = new ModelAndView("asset/AllAsset");
        mv.addObject("assets", allAssets);
        mv.addObject("asset", assetVo);
        return mv;
    }

    /**
     * 展示
     * 添加资产包页面
     */
    @RequestMapping("/asset/addAsset")
    public ModelAndView addAssetIndex() {
        return new ModelAndView("asset/addAsset");
    }

    /**
     * 执行
     * 添加资产包
     * @return
     */
    @RequestMapping("/asset/add/do")
    @ResponseBody
    public ResponseVo doAddAsset(PolAsset asset) {
        System.out.println(asset.toString());
        ResponseVo responseVo = new ResponseVo();
        try {
            assetService.addAsset(asset);
            responseVo.setSuccess(true);
            responseVo.setMsg("success");
            responseVo.setData("添加成功");
        } catch (Exception e) {
            responseVo.setSuccess(false);
            responseVo.setMsg("fail");
        }
        return responseVo;
    }

    @RequestMapping("/asset/modifyAsset")
    public ModelAndView modifyAsset(PolAsset asset) {
        PolAsset dbRecord = assetService.findById(asset.getId());
        ModelAndView mv = new ModelAndView("asset/modifyAsset");
        mv.addObject("asset", dbRecord);
        return mv;
    }
    /**
     * 执行
     * 添加资产包
     * @return
     */
    @RequestMapping("/asset/modify/do")
    @ResponseBody
    public ResponseVo doModifyAsset(PolAsset asset) {
        ResponseVo responseVo = new ResponseVo();
        try {
            assetService.modifyAsset(asset);
            responseVo.setSuccess(true);
            responseVo.setMsg("success");
            responseVo.setData("添加成功");
        } catch (Exception e) {
            logger.error("", e);
            responseVo.setSuccess(false);
            responseVo.setMsg("fail");
        }
        return responseVo;
    }

    @RequestMapping("/asset/assignAsset")
    public ModelAndView assignAsset(PolAsset asset) {
        asset = assetService.findById(asset.getId());
        ModelAndView mv = new ModelAndView("asset/AssignAsset");
        mv.addObject("asset", asset);
        return mv;
    }


    @RequestMapping("/asset/queryAll")
    @ResponseBody
    public List<PolAsset> queryAllAssets() {
        return null;
    }
}
