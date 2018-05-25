function [IPaddress] = GET_IPv4()
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
address = java.net.InetAddress.getLocalHost;
IPaddress = char(address.getHostAddress);
end

