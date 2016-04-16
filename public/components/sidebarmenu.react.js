var React = require('react');

var TreeView = React.createClass({
    getInitialState: function() {
        return { opened: false };
    },
    handleClick: function(event) {
        this.setState({ opened: !this.state.opened });
    },
    render: function() {
        var treeviewClass = 'treeview' + (this.state.opened ? ' active' : '');
        var treeviewMenuClass = 'treeview-menu' + (this.state.opened ? ' menu-open' : '');

        return (
            <li className={treeviewClass} onClick={this.handleClick}>
                <a href="javascript:void(0);">
                    <i className="fa fa-pie-chart"></i>
                        <span>Leaf</span>
                    <i className="fa fa-angle-left pull-right"></i>
                </a>
                <ul className={treeviewMenuClass}>
                    <li><a href="javascript:void(0);"><i className="fa fa-circle-o"></i> Node</a></li>
                    <li><a href="javascript:void(0);"><i className="fa fa-circle-o"></i> Node</a></li>
                    <li><a href="javascript:void(0);"><i className="fa fa-circle-o"></i> Node</a></li>
                    <li><a href="javascript:void(0);"><i className="fa fa-circle-o"></i> Node</a></li>
                </ul>
            </li>
        );
    }
});

var SidebarMenu = React.createClass({
    render: function() {
        return (
            <ul className="sidebar-menu">
                <TreeView />
            </ul>
        );
    }
});

module.exports = SidebarMenu;