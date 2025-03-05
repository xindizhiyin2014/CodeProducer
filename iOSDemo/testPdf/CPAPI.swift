//
//  CPAPI.swift
//  Code producer demo
//
//  Created by admin on 2025/02/08
//

import Foundation
import Moya
import Alamofire

enum CPAPI {
/// ---
/// api网址：http://127.0.0.1:5000/apidocs/#/Hello World/get_helloWorld
case helloworld
/// ---
/// api网址：http://127.0.0.1:5000/apidocs/#/修改用户信息/post_ModifyUserInfo
/// userId: 用户的唯一标识符
/// userData: 用户相关数据
case modifyuserinfo(userId: Int64, userData: JKUserdataModel)
/// ---
/// api网址：http://127.0.0.1:5000/apidocs/#/userInfo/get_userInfo
/// uid: 用户年龄
case userinfo(uid: Int64)
/// ---
/// api网址：http://127.0.0.1:5000/apidocs/#/userList/get_userList
/// page: 页码，从1开始
/// per_page: 每页显示的用户数量
case userlist(page: Int64, per_page: Int64)
/// 获取用户列表
/// api网址：http://127.0.0.1:5000/apidocs/#/userList/get_userList2
/// page: 页码，从1开始
/// per_page: 每页显示的用户数量
case userlist2(page: Int64, per_page: Int64)
/// 获取用户列表
/// api网址：http://127.0.0.1:5000/apidocs/#/用户管理/get_userList1
/// page: 页码，从1开始
/// per_page: 每页显示的用户数量
case userlist1(page: Int64, per_page: Int64)
//    ###EnumCase###
}

extension CPAPI: TargetType {
//    网络请求方法
    var method: Alamofire.HTTPMethod {
        switch self {
           case .helloworld:
               return .get
           case .modifyuserinfo:
               return .post
           case .userinfo:
               return .get
           case .userlist:
               return .get
           case .userlist2:
               return .get
           case .userlist1:
               return .get
//    ###RequestMethodStart###
//    ###RequestMethodEnd###
            default:
                break
        }
    }

    var parameterEncoding: ParameterEncoding {
        switch self {
           case .helloworld:
               return JSONEncoding.default
           case .modifyuserinfo:
               return JSONEncoding.default
           case .userinfo:
               return JSONEncoding.default
           case .userlist:
               return JSONEncoding.default
           case .userlist2:
               return JSONEncoding.default
           case .userlist1:
               return JSONEncoding.default
//    ###ParameterEncodingStart###
//    ###ParameterEncodingEnd###
            default:
                break
        }
        return JSONEncoding.default
    }

    ///各个请求的具体路径
    var path: String {
        switch self {
           case .helloworld:
               return "/helloWorld"
           case .modifyuserinfo:
               return "/ModifyUserInfo"
           case .userinfo:
               return "/userInfo"
           case .userlist:
               return "/userList"
           case .userlist2:
               return "/userList2"
           case .userlist1:
               return "/userList1"
//     ###RequestPath###
            default:
                break
        }
    }

    ///请求任务事件（这里附带上参数）
    var task: Task {
        var parameters: [String: Any] = [:]
        switch self {
            case .modifyuserinfo(let userId, let userData):
               parameters["userId"] = userId
               parameters["userData"] = cp_convertToJson<JKUserdataModel>(userData)
            case .userinfo(let uid):
               parameters["uid"] = uid
            case .userlist(let page, let per_page):
               parameters["page"] = page
               parameters["per_page"] = per_page
            case .userlist2(let page, let per_page):
               parameters["page"] = page
               parameters["per_page"] = per_page
            case .userlist1(let page, let per_page):
               parameters["page"] = page
               parameters["per_page"] = per_page
//            ###RequestTask###
            default:
                break
        }
        return .requestCompositeParameters(bodyParameters: parameters, bodyEncoding: parameterEncoding, urlParameters: [String: Any]())
    }


}

