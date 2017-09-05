import React from 'react'
import _ from 'lodash'
import ReactTable from 'react-table'
import {
    BrowserRouter as Router,
    Route,
    Link
} from 'react-router-dom'

import { Input, CheckboxGroup } from './editor.jsx'

const columns = [{
    Header: 'Name',
    accessor: 'name'
}, {
    Header: 'Connecting From',
    accessor: 'connecting_from'
}, {
    Header: 'State',
    accessor: 'state'
}, {
    Header: 'Status',
    accessor: 'status'
}, {
    Header: 'VLAN ID',
    accessor: 'mgmt_vlanid'
}, {
    Header: 'Clients',
    accessor: 'clients'
}, {
    Header: 'Version',
    accessor: 'os_version'
}, {
    Header: 'Local IP',
    accessor: 'local_ipv4_addr'
}, {
    Header: 'Mac',
    accessor: 'board_mac'
}, {
    Header: 'Connection State',
    accessor: 'connection_state'
}, {
    Header: '',
    accessor: 'name',
    Cell: (props) => {
        return (
            <Link to={
                {
                    pathname: `AccessPointForm`, 
                    search: `?sn=${props.value}`
                }
            }>
                <i className="fa fa-pencil"></i>
            </Link>
        )
    }
}]

class APForm extends React.Component {
    constructor(props) {
        super(props);
        this.handleChange = this.handleChange.bind(this)
        this.state = {
            serial: '',
            name: '',
            tags: []
        }
    }
    componentDidMount() {
        let self = this
        fetch('/AP' + this.props.location.search).then(function(response) {
            response.json().then(function(json) {
                self.handleChange({ target: { name: 'serial', value: json.result[0].data[0].serial } })
                self.handleChange({ target: { name: 'name', value: json.result[0].data[0].name } })
                const tags = [{ label: 'one', value: true }, { label: 'two', value: false }, { label: 'three', value: false }]
                for (let i = 0; i < 3; ++i) {
                    self.handleChange({ target: { type: 'checkbox', name: tags[i].label, label: tags[i].label, value: tags[i].value } }, i)
                }
            })
        });
    }
    handleChange(e, index) {
        const target = e.target
        const value = target.type === 'checkbox' ? target.checked : target.value
        const name = target.name
        if (target.type !== 'checkbox') {
            console.log(target)
            this.setState({
                [name]: value
            })
        } else {
            console.log(target, index)
            const tags = this.state.tags.slice()
            this.setState((prevState) => {
                const prevValue = prevState.tags[index] ? prevState.tags[index].value : target.value
                tags[index] = { name: target.name, label: target.name, value: !prevValue };
                return {
                    tags: tags
                }
            })
        }
    }
    render() {
        const serial = this.state.serial
        const name = this.state.name
        const tags = this.state.tags
        console.log(tags)
        return (
            <div className="col-md-12">
                <div className="box box-primary">
                    <div className="box-header with-border">
                        <h3 className="box-title">Configure Access Point</h3>
                    </div>
                    <div className="form-horizontal">
                        <div className="box-body">
                            <Input 
                                name="serial"
                                type="text" 
                                label="Serial Number" 
                                value={serial} 
                                left="col-sm-2" 
                                right="col-sm-10" 
                                disabled={true}
                            />
                            <Input 
                                name="name"
                                type="text" 
                                label="Name" 
                                value={name} 
                                left="col-sm-2" 
                                right="col-sm-10" 
                                onChange={this.handleChange} 
                            />
                            <CheckboxGroup 
                                className="col-sm-offset-2 col-sm-10" 
                                labels={tags} 
                                onChange={this.handleChange}
                            />
                        </div>
                        <div className="box-footer">
                            <button type="submit" className="btn btn-default">Cancel</button>
                            <button type="submit" className="btn btn-info pull-right">Apply</button>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}

class APTable extends React.Component {
    constructor(props) {
        super(props);
        this.state = { data: [] };
    }
    componentDidMount() {
        let self = this
        fetch('/AP').then(function(response) {
            response.json().then(function(json) {
                self.setState({
                    data: json.result[0].data
                })
            })
        });
    }
    render() {
        return (
            <div className="col-md-12">
                <div className="box">
                    <div className="box-header with-border">
                        <h3 className="box-title">Status View</h3>
                    </div>
                    <div className="box-body">
                        <ReactTable
                            data={this.state.data}
                            columns={columns}
                            defaultPageSize={5}
                        />
                    </div>
                    <div className="box-footer clearfix"></div>
                </div>
            </div>
        )
    }
}

export function AccessPointList() {
    return (
        <section className="content">
            <div className="row">
                <APTable />
            </div>
        </section>
    )
}

export function AccessPointForm({ location }) {
    return (
        <section className="content">
            <div className="row">
                <APForm location ={ location } />
            </div>
        </section>
    )
}